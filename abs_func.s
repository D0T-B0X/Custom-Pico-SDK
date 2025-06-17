.syntax unified 
.cpu cortex-m0plus
.thumb
.thumb_func

.global start
.global peripheral_enable
.global gpio_enable
.global gpio_set_io
.global gpio_out

data:
    .equ   rst_clr,   0x4000f000
    .equ   rst_base,  0x4000c000  
    .equ   iob0_base, 0x40014000
    .equ   sio_base,  0xd0000000

peripheral_enable:
    ldr    r1, =rst_base  // load the reset base register
    ldr    r2, [r1, #0]   // load value in reset register
    movs   r3, #1
    lsls   r3, r3, r0     // set peripheral to enable
    orrs   r2, r2, r3     // set user specified peripheral register
    ldr    r1, =rst_clr   // load the reset clear atomic register
    str    r2, [r1, #0]   // store set bit in atomic clear register
    bx     lr

gpio_enable:
    ldr    r1, =iob0_base // load IO_BANK0 base register
    movs   r2, #8         
    muls   r0, r0, r2 
    movs   r2, #4
    adds   r0, r0, r2     // multiply the pin num by 8 and add 4 to get the control offset
    movs   r2, #5         // function select bitmask
    str    r2, [r1, r0]   // enable function select for the given gpio
    bx     lr

gpio_set_io:
    ldr    r2, =sio_base  // load sio base register
    movs   r3, #1
    lsls   r3, r3, r0     // create bitmask for given gpio
    str    r3, [r2, 0x24] // set gpio out enable
    bx     lr

gpio_out:
    ldr    r2, =sio_base  // load sio base register
    cmp    r1, #0
    beq    .clear_pin

    movs   r3, #1
    lsls   r3, r3, r0
    str    r3, [r2, 0x14]
    b      .done

.clear_pin:
    movs   r3, #1
    lsls   r3, r3, r0
    str    r3, [r2, 0x18]

.done:
    bx     lr
