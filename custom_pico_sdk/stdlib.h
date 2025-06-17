#ifndef STDLIB_H
#define STDLIB_H

// IO_BANK0 peripheral enable bit
#define IO_BANK0_ID 5

// GPIO direction constants
#define GPIO_OUT 1
#define GPIO_IN 0

// Bool variables
#define true 1
#define false 0

// External assembly functions
extern void peripheral_enable(int peripheral);
extern void gpio_enable(int gpio_pin);
extern void gpio_set_io(int gpio_pin);
extern void gpio_out(int gpio_value, int state);

#endif