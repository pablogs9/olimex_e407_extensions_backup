#include <rcl/rcl.h>
#include <rcl/error_handling.h>
#include <std_msgs/msg/int32.h>

#include <rmw_uros/options.h>

#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

#define RCCHECK(fn) { rcl_ret_t temp_rc = fn; if((temp_rc != RCL_RET_OK)){printf("Failed status on line %d: %d. Aborting.\n",__LINE__,(int)temp_rc);  vTaskDelete(NULL);;}}
#define RCSOFTCHECK(fn) { rcl_ret_t temp_rc = fn; if((temp_rc != RCL_RET_OK)){printf("Failed status on line %d: %d. Continuing.\n",__LINE__,(int)temp_rc);}}

void * trigger_guard_condition(void *args){
  rcl_guard_condition_t * guard_condition = (rcl_guard_condition_t *)args;

  while(true){
    RCSOFTCHECK(rcl_trigger_guard_condition(guard_condition))
    sleep(1);
  }
}

void appMain(void *argument)
{
  rcl_init_options_t options = rcl_get_zero_initialized_init_options();
  RCCHECK(rcl_init_options_init(&options, rcl_get_default_allocator()))

  rcl_context_t context = rcl_get_zero_initialized_context();
  RCCHECK(rcl_init(0, NULL, &options, &context))

  rcl_node_options_t node_ops = rcl_node_get_default_options();

  rcl_node_t node = rcl_get_zero_initialized_node();
  RCCHECK(rcl_node_init(&node, "int32_publisher_rcl", "", &context, &node_ops))

  rcl_publisher_options_t publisher_ops = rcl_publisher_get_default_options();
  rcl_publisher_t publisher = rcl_get_zero_initialized_publisher();
  RCCHECK(rcl_publisher_init(&publisher, &node, ROSIDL_GET_MSG_TYPE_SUPPORT(std_msgs, msg, Int32), "/olimex/publisher", &publisher_ops))

  rcl_subscription_options_t subscription_ops = rcl_subscription_get_default_options();
  rcl_subscription_t subscription = rcl_get_zero_initialized_subscription();
  RCCHECK(rcl_subscription_init(&subscription, &node, ROSIDL_GET_MSG_TYPE_SUPPORT(std_msgs, msg, Int32), "/olimex/subscriber", &subscription_ops))

  rcl_guard_condition_t guard_condition = rcl_get_zero_initialized_guard_condition();
  rcl_guard_condition_options_t guard_condition_options = rcl_guard_condition_get_default_options();
  RCCHECK(rcl_guard_condition_init(&guard_condition, &context, guard_condition_options))

  pthread_t guard_condition_thread;
  pthread_create(&guard_condition_thread, NULL, trigger_guard_condition, &guard_condition);

  rcl_wait_set_t wait_set = rcl_get_zero_initialized_wait_set();
  RCCHECK(rcl_wait_set_init(&wait_set, 1, 1, 0, 0, 0, 0, &context, rcl_get_default_allocator()))

  std_msgs__msg__Int32 msg;
  const int num_msg = 1000;
  msg.data = 0;
  
  
  sleep(2); // Sleep a while to ensure DDS matching before sending request

  rcl_ret_t rc;
  do {
    rc = rcl_publish(&publisher, (const void*)&msg, NULL);
    if (RCL_RET_OK == rc ) {
        printf("Sent: '%i'\n", msg.data++);
    }

    RCSOFTCHECK(rcl_wait_set_clear(&wait_set))
    
    size_t index;
    RCSOFTCHECK(rcl_wait_set_add_subscription(&wait_set, &subscription, &index))
    
    RCSOFTCHECK(rcl_wait(&wait_set, RCL_MS_TO_NS(10)))

    if (wait_set.subscriptions[index]) {
      std_msgs__msg__Int32 msg;
      rc = rcl_take(wait_set.subscriptions[index], &msg, NULL, NULL);
      if (RCL_RET_OK == rc) {
        printf("I received: [%i]\n", msg.data);
      }
    }

    usleep(10000);
  } while (true );
  printf("TOTAL sent: %i\n", num_msg);

  RCCHECK(rcl_publisher_fini(&publisher, &node))
  RCCHECK(rcl_node_fini(&node))

  vTaskDelete(NULL);
}