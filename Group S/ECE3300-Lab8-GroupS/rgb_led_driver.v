`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/12/2025 02:54:59 PM
// Design Name: 
// Module Name: rgb_led_driver
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


module rgb_led_driver #(parameter ACTIVE_LOW=1)(
input wire pwm_r, pwm_g, pwm_b,
output wire led_r, led_g, led_b
);
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