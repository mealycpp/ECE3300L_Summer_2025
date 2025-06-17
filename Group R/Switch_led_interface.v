`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2025 01:52:31 PM
// Design Name: 
// Module Name: Switch_led_interface
// Project Name: lab 1
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


module Switch_led_interface(input wire [15:0] SW, output wire [15:0] LED);

 assign LED = SW;
 
endmodule
 
