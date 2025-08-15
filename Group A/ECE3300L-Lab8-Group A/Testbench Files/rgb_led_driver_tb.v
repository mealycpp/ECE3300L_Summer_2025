`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2025 07:00:56 PM
// Design Name: 
// Module Name: rgb_led_driver_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rgb_led_driver_tb(

    );
    
    reg pwm_r, pwm_g, pwm_b;
    wire led_r, led_g, led_b;
    
    rgb_led_driver driver(pwm_r, pwm_g, pwm_b, led_r, led_g, led_b);
    
    initial begin
        pwm_r = 0;
        pwm_g = 0;
        pwm_b = 0;
        #5 pwm_r = 0;
        pwm_g = 0;
        pwm_b = 1;
        #5 pwm_r = 0;
        pwm_g = 1;
        pwm_b = 0;
        #5 pwm_r = 0;
        pwm_g = 1;
        pwm_b = 1;
        #5 pwm_r = 1;
        pwm_g = 0;
        pwm_b = 0;
        #5 pwm_r = 1;
        pwm_g = 0;
        pwm_b = 1;
        #5 pwm_r = 1;
        pwm_g = 1;
        pwm_b = 0;
        #5 pwm_r = 1;
        pwm_g = 1;
        pwm_b = 1;
    end
    
endmodule
