

#include "common.h"
#include <driver/uart.h>

void UART_config() {
    
    const int uart_num = UART_NUM_0; // use 0 for ESP32C3 and 2 for ESP32
    
    uart_config_t uart_config = {
        .baud_rate = 115200,
        .data_bits = UART_DATA_8_BITS,
        .parity = UART_PARITY_DISABLE,
        .stop_bits = UART_STOP_BITS_1,
        .flow_ctrl = UART_HW_FLOWCTRL_CTS_RTS,
        .rx_flow_ctrl_thresh = 122,
    };
    // Configure UART parameters
    ESP_ERROR_CHECK(uart_param_config(uart_num, &uart_config));

    uart_set_baudrate(uart_num, 115200);
}
