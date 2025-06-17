`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2025 06:56:19 AM
// Design Name: 
// Module Name: switch_led_interface
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


module switch_led_interface(
    input [15:0] SW,
    output [15:0] LED
    );
    assign LED = SW;
endmodule
