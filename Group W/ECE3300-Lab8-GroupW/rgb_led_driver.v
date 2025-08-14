`timescale 1ns/1ps
module rgb_led_driver #(
    parameter ACTIVE_LOW = 0
)(
    input wire pwm_r,
    input wire pwm_g,
    input wire pwm_b,
    output wire led_r,
    output wire led_g,
    output wire led_b
);

// Conditional inversion based on polarity
assign led_r = ACTIVE_LOW ? ~pwm_r : pwm_r;
assign led_g = ACTIVE_LOW ? ~pwm_g : pwm_g;
assign led_b = ACTIVE_LOW ? ~pwm_b : pwm_b;

endmodule
