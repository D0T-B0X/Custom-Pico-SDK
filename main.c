#include "custom_pico_sdk/stdlib.h"

void sleep(int seconds) {
    for(volatile int i = 0; i < seconds * 10000000; i++) {}
}

int main() {
    // Enable IO_BANK0 peripheral
    peripheral_enable(IO_BANK0_ID);
    
    // Configure GPIO 15
    gpio_enable(15);       // Set GPIO 15 to SIO function
    gpio_set_io(15);       // Set GPIO 15 as output

    // Main loop - blink LED
    while (1) {
        // Turn on LED (set bit 15 only)
        gpio_out(15, true);

        sleep(1);
        
        // Turn off LED
        gpio_out(15, false);

        sleep(1);
    }
    
    return 0;
}