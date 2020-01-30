#include "olimex_e407_serial_transport.h"
#include "stm32f4xx_hal_dma.h"

#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>

#define UART_DMA_BUFFER_SIZE 2048

static uint8_t dma_buffer[UART_DMA_BUFFER_SIZE];
static size_t dma_head = 0, dma_tail = 0;

// static uint8_t * crtp_buffer = (uint8_t *)0x10000000;

bool uxr_init_serial_platform(struct uxrSerialPlatform* platform, int fd, uint8_t remote_addr, uint8_t local_addr)
{
  switch ( fd ){
      case 1:
        platform->uart = &huart1;
        break;
      case 3:
        platform->uart = &huart3;
        break;
      case 6:
        platform->uart = &huart6;
        break;
      default:
        return false;
  }
  HAL_UART_Receive_DMA(platform->uart, dma_buffer, UART_DMA_BUFFER_SIZE);
  return true;
}

bool uxr_close_serial_platform(struct uxrSerialPlatform* platform)
{   
  HAL_UART_DMAStop(platform->uart);
  return true;
}

size_t uxr_write_serial_data_platform(uxrSerialPlatform* platform, uint8_t* buf, size_t len, uint8_t* errcode)
{
  
  HAL_StatusTypeDef ret;
  // ret = HAL_UART_Transmit(platform->uart, buf, len, 1000);

  ret = HAL_UART_Transmit_DMA(platform->uart, buf, len);
  while (ret == HAL_OK && platform->uart->gState != HAL_UART_STATE_READY){
    osDelay(1);
  }

  return (ret == HAL_OK) ? len : 0;
}

size_t uxr_read_serial_data_platform(uxrSerialPlatform* platform, uint8_t* buf, size_t len, int timeout, uint8_t* errcode)
{ 
  size_t wrote = 0;
  osDelay(timeout);

  __disable_irq();
  dma_tail = UART_DMA_BUFFER_SIZE - __HAL_DMA_GET_COUNTER(platform->uart->hdmarx);
  __enable_irq();

  if (((dma_head + len) % UART_DMA_BUFFER_SIZE) <= dma_tail){ // Buffer has more or eq data than required
    wrote = len;
  }else if (((dma_head + len) % UART_DMA_BUFFER_SIZE) > dma_tail){ // Buffer has less data than required
    wrote = dma_tail - dma_head;
  }
  memcpy(buf, &dma_buffer[dma_head],wrote);
  dma_head += wrote;
  
  return wrote;
}