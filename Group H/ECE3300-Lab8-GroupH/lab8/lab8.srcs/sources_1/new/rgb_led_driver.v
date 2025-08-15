`timescale 1ns/1ps
module rgb_led_driver #(
    parameter ACTIVE_LOW = 1
)(
    input  wire pwm_r, 
    input  wire pwm_g, 
    input  wire pwm_b,
    output wire led_r, 
    output wire led_g, 
    output wire led_b
);

    // This block inverts the PWM signal if the LEDs are active-low.
    generate
        if (ACTIVE_LOW) begin
            assign led_r = ~pwm_r;
            assign led_g = ~pwm_g;
            assign led_b = ~pwm_b;
        end else begin
            assign led_r = pwm_r;
            assign led_g = pwm_g;
            assign led_b = pwm_b;
        end
    endgenerate

endmodule