##########################################################################################################################
# File automatically-generated by tool: [projectgenerator] version: [3.6.0] date: [Wed Jan 29 11:12:37 CET 2020] 
##########################################################################################################################

# ------------------------------------------------
# Generic Makefile (based on gcc)
#
# ChangeLog :
#	2017-02-10 - Several enhancements + project update mode
#   2015-07-22 - first version
# ------------------------------------------------

######################################
# target
######################################
TARGET = micro-ROS


######################################
# building variables
######################################
# debug build?
DEBUG ?= 1
# optimization
OPT = -Og

ifeq ($(DEBUG), 1)
  	BUILD_TYPE = Debug
else
	BUILD_TYPE = Release
endif


#######################################
# paths
#######################################
# Build path
EXTENSIONS_DIR = $(shell pwd)
TOPFOLDER = $(EXTENSIONS_DIR)/..
UROS_DIR = $(TOPFOLDER)/mcu_ws
BUILD_DIR = $(EXTENSIONS_DIR)/build

######################################
# source
######################################
# C sources
C_SOURCES =  \
Src/main.c \
Src/freertos.c \
Src/stm32f4xx_it.c \
Src/stm32f4xx_hal_msp.c \
Src/stm32f4xx_hal_timebase_tim.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_exti.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c \
Src/system_stm32f4xx.c \
Middlewares/Third_Party/FreeRTOS/Source/croutine.c \
Middlewares/Third_Party/FreeRTOS/Source/event_groups.c \
Middlewares/Third_Party/FreeRTOS/Source/list.c \
Middlewares/Third_Party/FreeRTOS/Source/queue.c \
Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.c \
Middlewares/Third_Party/FreeRTOS/Source/tasks.c \
Middlewares/Third_Party/FreeRTOS/Source/timers.c \
Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2/cmsis_os2.c \
Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.c \
Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.c \
Src/lwip.c \
Src/ethernetif.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_eth.c \
Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.c \
Middlewares/Third_Party/LwIP/src/netif/ppp/auth.c \
Middlewares/Third_Party/LwIP/src/netif/ppp/ccp.c \
Middlewares/Third_Party/LwIP/src/netif/ppp/chap_ms.c \
Middlewares/Third_Party/LwIP/src/netif/ppp/chap-md5.c \
Middlewares/Third_Party/LwIP/src/netif/ppp/chap-new.c \
Middlewares/Third_Party/LwIP/src/netif/ppp/demand.c \
Middlewares/Third_Party/LwIP/src/netif/ppp/eap.c \
Middlewares/Third_Party/LwIP/src/netif/ppp/eui64.c \
Middlewares/Third_Party/LwIP/src/netif/ppp/fsm.c \
Middlewares/Third_Party/LwIP/src/netif/ppp/ipcp.c \
Middlewares/Third_Party/LwIP/src/netif/ppp/ipv6cp.c \
Middlewares/Third_Party/LwIP/src/netif/ppp/lcp.c \
Middlewares/Third_Party/LwIP/src/netif/ppp/magic.c \
Middlewares/Third_Party/LwIP/src/netif/ppp/mppe.c \
Middlewares/Third_Party/LwIP/src/netif/ppp/multilink.c \
Middlewares/Third_Party/LwIP/src/netif/ppp/ppp.c \
Middlewares/Third_Party/LwIP/src/netif/ppp/pppapi.c \
Middlewares/Third_Party/LwIP/src/netif/ppp/pppcrypt.c \
Middlewares/Third_Party/LwIP/src/netif/ppp/pppoe.c \
Middlewares/Third_Party/LwIP/src/netif/ppp/pppol2tp.c \
Middlewares/Third_Party/LwIP/src/netif/ppp/pppos.c \
Middlewares/Third_Party/LwIP/src/netif/ppp/upap.c \
Middlewares/Third_Party/LwIP/src/netif/ppp/utils.c \
Middlewares/Third_Party/LwIP/src/netif/ppp/vj.c \
Middlewares/Third_Party/LwIP/src/netif/ethernet.c \
Middlewares/Third_Party/LwIP/src/netif/slipif.c \
Middlewares/Third_Party/LwIP/src/netif/lowpan6.c \
Middlewares/Third_Party/LwIP/src/netif/ppp/ecp.c \
Middlewares/Third_Party/LwIP/src/api/sockets.c \
Middlewares/Third_Party/LwIP/src/api/api_lib.c \
Middlewares/Third_Party/LwIP/src/api/netifapi.c \
Middlewares/Third_Party/LwIP/src/api/tcpip.c \
Middlewares/Third_Party/LwIP/src/api/err.c \
Middlewares/Third_Party/LwIP/src/api/api_msg.c \
Middlewares/Third_Party/LwIP/src/api/netdb.c \
Middlewares/Third_Party/LwIP/src/api/netbuf.c \
Middlewares/Third_Party/LwIP/src/core/pbuf.c \
Middlewares/Third_Party/LwIP/src/core/timeouts.c \
Middlewares/Third_Party/LwIP/src/core/netif.c \
Middlewares/Third_Party/LwIP/src/core/memp.c \
Middlewares/Third_Party/LwIP/src/core/inet_chksum.c \
Middlewares/Third_Party/LwIP/src/core/dns.c \
Middlewares/Third_Party/LwIP/src/core/ip.c \
Middlewares/Third_Party/LwIP/src/core/tcp.c \
Middlewares/Third_Party/LwIP/src/core/def.c \
Middlewares/Third_Party/LwIP/src/core/raw.c \
Middlewares/Third_Party/LwIP/src/core/init.c \
Middlewares/Third_Party/LwIP/src/core/mem.c \
Middlewares/Third_Party/LwIP/src/core/stats.c \
Middlewares/Third_Party/LwIP/src/core/tcp_in.c \
Middlewares/Third_Party/LwIP/src/core/sys.c \
Middlewares/Third_Party/LwIP/src/core/tcp_out.c \
Middlewares/Third_Party/LwIP/src/core/udp.c \
Middlewares/Third_Party/LwIP/src/core/ipv4/dhcp.c \
Middlewares/Third_Party/LwIP/src/core/ipv4/ip4_addr.c \
Middlewares/Third_Party/LwIP/src/core/ipv4/autoip.c \
Middlewares/Third_Party/LwIP/src/core/ipv4/igmp.c \
Middlewares/Third_Party/LwIP/src/core/ipv4/icmp.c \
Middlewares/Third_Party/LwIP/src/core/ipv4/etharp.c \
Middlewares/Third_Party/LwIP/src/core/ipv4/ip4_frag.c \
Middlewares/Third_Party/LwIP/src/core/ipv4/ip4.c \
Middlewares/Third_Party/LwIP/src/core/ipv6/ip6_frag.c \
Middlewares/Third_Party/LwIP/src/core/ipv6/dhcp6.c \
Middlewares/Third_Party/LwIP/src/core/ipv6/ip6.c \
Middlewares/Third_Party/LwIP/src/core/ipv6/ip6_addr.c \
Middlewares/Third_Party/LwIP/src/core/ipv6/icmp6.c \
Middlewares/Third_Party/LwIP/src/core/ipv6/nd6.c \
Middlewares/Third_Party/LwIP/src/core/ipv6/mld6.c \
Middlewares/Third_Party/LwIP/src/core/ipv6/ethip6.c \
Middlewares/Third_Party/LwIP/src/core/ipv6/inet6.c \
Middlewares/Third_Party/LwIP/system/OS/sys_arch.c \
Middlewares/Third_Party/LwIP/src/apps/mqtt/mqtt.c \
FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_utils.c \
FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_clock.c \
FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_sched.c \
FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_unistd.c \
FreeRTOS-Plus-POSIX/source/FreeRTOS_POSIX_pthread.c \
Src/custom_memory_manager.c \
Src/libatomic.c \
Src/allocators.c \
Src/app.c

# Removing heap4 manager while being polite with STM32CubeMX
TMPVAR := $(C_SOURCES)
C_SOURCES := $(filter-out Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.c, $(TMPVAR))

# ASM sources
ASM_SOURCES =  \
startup_stm32f407xx.s


#######################################
# binaries
#######################################
# The gcc compiler bin path can be either defined in make command via GCC_PATH variable (> make GCC_PATH=xxx)
# either it can be added to the PATH environment variable.
CROSS_COMPILE_PREFIX = $(TOPFOLDER)/toolchain/bin/arm-none-eabi-

ifdef GCC_PATH
CC = $(GCC_PATH)/$(CROSS_COMPILE_PREFIX)gcc
AS = $(GCC_PATH)/$(CROSS_COMPILE_PREFIX)gcc -x assembler-with-cpp
CP = $(GCC_PATH)/$(CROSS_COMPILE_PREFIX)objcopy
SZ = $(GCC_PATH)/$(CROSS_COMPILE_PREFIX)size
else
CC = $(CROSS_COMPILE_PREFIX)gcc
AS = $(CROSS_COMPILE_PREFIX)gcc -x assembler-with-cpp
CP = $(CROSS_COMPILE_PREFIX)objcopy
SZ = $(CROSS_COMPILE_PREFIX)size
endif
HEX = $(CP) -O ihex
BIN = $(CP) -O binary -S
 
#######################################
# CFLAGS
#######################################
# cpu
CPU = -mcpu=cortex-m4

# fpu
FPU = -mfpu=fpv4-sp-d16

# float-abi
FLOAT-ABI = -mfloat-abi=hard

# mcu
MCU = $(CPU) -mthumb $(FPU) $(FLOAT-ABI)

# macros for gcc
# AS defines
AS_DEFS = 

# C defines
C_DEFS =  \
-DUSE_HAL_DRIVER \
-DSTM32F407xx \
-D_TIMEVAL_DEFINED

# AS includes
AS_INCLUDES =  \
-IInc

# C includes
C_INCLUDES =  \
-IInc \
-IDrivers/STM32F4xx_HAL_Driver/Inc \
-IDrivers/STM32F4xx_HAL_Driver/Inc/Legacy \
-IMiddlewares/Third_Party/FreeRTOS/Source/include \
-IMiddlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 \
-IMiddlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F \
-IDrivers/CMSIS/Device/ST/STM32F4xx/Include \
-IDrivers/CMSIS/Include \
-IDrivers/CMSIS/Include \
-IMiddlewares/Third_Party/LwIP/src/include \
-IMiddlewares/Third_Party/LwIP/system \
-IMiddlewares/Third_Party/LwIP/src/include/netif/ppp \
-IMiddlewares/Third_Party/LwIP/src/include/lwip \
-IMiddlewares/Third_Party/LwIP/src/include/lwip/apps \
-IMiddlewares/Third_Party/LwIP/src/include/lwip/priv \
-IMiddlewares/Third_Party/LwIP/src/include/lwip/prot \
-IMiddlewares/Third_Party/LwIP/src/include/netif \
-IMiddlewares/Third_Party/LwIP/src/include/posix \
-IMiddlewares/Third_Party/LwIP/src/include/posix/sys \
-IMiddlewares/Third_Party/LwIP/system/arch \
-IFreeRTOS-Plus-POSIX/include \
-IFreeRTOS-Plus-POSIX/include/portable/empty_portable \
-IFreeRTOS-Plus-POSIX/include/portable \
-Iinclude \
-Iinclude/private

MICROROS_INCLUDES += $(shell find $(UROS_DIR)/install -name 'include' | sed -E "s/(.*)/-I\1/")
MICROROS_INCLUDES += -I$(EXTENSIONS_DIR)/include
MICROROS_INCLUDES += -I$(EXTENSIONS_DIR)/include/FreeRTOS_POSIX
MICROROS_INCLUDES += -I$(EXTENSIONS_DIR)/include/private
MICROROS_INCLUDES += -I$(EXTENSIONS_DIR)/FreeRTOS-Plus-POSIX/include
MICROROS_INCLUDES += -I$(EXTENSIONS_DIR)/FreeRTOS-Plus-POSIX/include/portable
MICROROS_INCLUDES += -I$(EXTENSIONS_DIR)/FreeRTOS-Plus-POSIX/include/portable/crazyflie
MICROROS_INCLUDES += -I$(CRAZYFLIE_BASE)/src/lib/FreeRTOS/include
C_INCLUDES += $(MICROROS_INCLUDES)

COLCON_INCLUDES += $(EXTENSIONS_DIR)/FreeRTOS-Plus-POSIX/include 
COLCON_INCLUDES += $(EXTENSIONS_DIR)/include 
COLCON_INCLUDES += $(EXTENSIONS_DIR)/include/private 
COLCON_INCLUDES += $(EXTENSIONS_DIR)/include/FreeRTOS_POSIX 
COLCON_INCLUDES += $(EXTENSIONS_DIR)/include/FreeRTOS_POSIX/sys
COLCON_INCLUDES += $(EXTENSIONS_DIR)/src/hal/interface 
COLCON_INCLUDES += $(EXTENSIONS_DIR)/src/modules/interface 
COLCON_INCLUDES += $(EXTENSIONS_DIR)/src/utils/interface 
COLCON_INCLUDES += $(EXTENSIONS_DIR)/src/config 
COLCON_INCLUDES += $(EXTENSIONS_DIR)/src/drivers/interface
COLCON_INCLUDES += $(EXTENSIONS_DIR)/Middlewares/Third_Party/LwIP/src/include/posix
COLCON_INCLUDES += $(EXTENSIONS_DIR)/Middlewares/Third_Party/LwIP/src/include
COLCON_INCLUDES += $(EXTENSIONS_DIR)/Inc
COLCON_INCLUDES += $(EXTENSIONS_DIR)/Drivers/STM32F4xx_HAL_Driver/Inc
COLCON_INCLUDES += $(EXTENSIONS_DIR)/Drivers/CMSIS/Device/ST/STM32F4xx/Include
COLCON_INCLUDES += $(EXTENSIONS_DIR)/Drivers/CMSIS/Include
COLCON_INCLUDES += $(EXTENSIONS_DIR)/Middlewares/Third_Party/LwIP/system
COLCON_INCLUDES_STR := $(foreach x,$(COLCON_INCLUDES),$(x)\n)

# compile gcc flags
ASFLAGS = $(MCU) $(AS_DEFS) $(AS_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections

CFLAGS = $(MCU) $(C_DEFS) $(C_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections

ifeq ($(DEBUG), 1)
CFLAGS += -g -gdwarf-2
endif

# Generate dependency information
CFLAGS += -MMD -MP -MF"$(@:%.o=%.d)"

ARCHCPUFLAGS = $(MCU) $(C_DEFS) $(OPT) -Wall -fdata-sections -ffunction-sections

#######################################
# LDFLAGS
#######################################
# link script
LDSCRIPT = STM32F407ZGTx_FLASH.ld

# libraries
LIBS = -lc -lm -lnosys 
LIBDIR = 
LDFLAGS = $(MCU) --specs=nosys.specs -specs=nano.specs -T$(LDSCRIPT) $(LIBDIR) $(LIBS) -Wl,-Map=$(BUILD_DIR)/$(TARGET).map,--cref -Wl,--gc-sections

# default action: build all
all: $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/$(TARGET).hex $(BUILD_DIR)/$(TARGET).bin

#######################################
# build micro-ROS
#######################################

arm_toolchain: $(EXTENSIONS_DIR)/arm_toolchain.cmake.in
	rm -f $(EXTENSIONS_DIR)/arm_toolchain.cmake; \
	cat $(EXTENSIONS_DIR)/arm_toolchain.cmake.in | \
		sed "s/@CROSS_COMPILE_PREFIX@/$(subst /,\/,$(CROSS_COMPILE_PREFIX))/g" | \
		sed "s/@FREERTOS_TOPDIR@/$(subst /,\/,$(TOPFOLDER))/g" | \
		sed "s/@ARCH_CPU_FLAGS@/\"$(ARCHCPUFLAGS)\"/g" | \
		sed "s/@ARCH_OPT_FLAGS@/\"$(ARCHOPTIMIZATION)\"/g" | \
		sed "s/@INCLUDES@/$(subst /,\/,$(COLCON_INCLUDES_STR))/g" \
		> $(EXTENSIONS_DIR)/arm_toolchain.cmake

colcon_compile: arm_toolchain
	cd $(UROS_DIR); \
	colcon build \
		--packages-ignore-regex=.*_cpp \
		--cmake-args \
		-DCMAKE_POSITION_INDEPENDENT_CODE=OFF \
		-DTHIRDPARTY=ON \
		-DBUILD_SHARED_LIBS=OFF \
		-DBUILD_TESTING=OFF \
		-DCMAKE_BUILD_TYPE=$(BUILD_TYPE) \
		-DCMAKE_TOOLCHAIN_FILE=$(EXTENSIONS_DIR)/arm_toolchain.cmake \
		-DCMAKE_VERBOSE_MAKEFILE=ON; \

libmicroros: colcon_compile
	mkdir -p $(UROS_DIR)/libmicroros; cd $(UROS_DIR)/libmicroros; \
	for file in $$(find $(UROS_DIR)/install/ -name '*.a'); do \
		folder=$$(echo $$file | sed -E "s/(.+)\/(.+).a/\2/"); \
		mkdir -p $$folder; cd $$folder; ar x $$file; \
		for f in *; do \
			mv $$f ../$$folder-$$f; \
		done; \
		cd ..; rm -rf $$folder; \
	done ; \
	ar rc libmicroros.a *.obj; mkdir -p $(BUILD_DIR); cp libmicroros.a $(BUILD_DIR); ranlib $(BUILD_DIR)/libmicroros.a; \
	cd ..; rm -rf libmicroros;

#######################################
# build the application
#######################################
# list of objects
OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(C_SOURCES:.c=.o)))
OBJECTS += $(BUILD_DIR)/libmicroros.a

vpath %.c $(sort $(dir $(C_SOURCES)))
# list of ASM program objects
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_SOURCES:.s=.o)))
vpath %.s $(sort $(dir $(ASM_SOURCES)))

$(BUILD_DIR)/%.o: %.c Makefile | $(BUILD_DIR) 
	$(CC) -c $(CFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(notdir $(<:.c=.lst)) $< -o $@

$(BUILD_DIR)/%.o: %.s Makefile | $(BUILD_DIR)
	$(AS) -c $(CFLAGS) $< -o $@

$(BUILD_DIR)/$(TARGET).elf: $(OBJECTS) Makefile
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@
	$(SZ) $@

$(BUILD_DIR)/%.hex: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(HEX) $< $@
	
$(BUILD_DIR)/%.bin: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(BIN) $< $@	
	
$(BUILD_DIR):
	mkdir $@		

#######################################
# clean up
#######################################
clean:
	-rm -fR $(BUILD_DIR)
  
#######################################
# dependencies
#######################################
-include $(wildcard $(BUILD_DIR)/*.d)

# *** EOF ***
