`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2025 06:25:29 PM
// Design Name: 
// Module Name: switch_led_interface
// Project Name: Lab 1
// Target Devices: Artix-7 
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
input wire [15:0] x,
output wire [15:0] z
    );
    assign z = x;

endmodule
