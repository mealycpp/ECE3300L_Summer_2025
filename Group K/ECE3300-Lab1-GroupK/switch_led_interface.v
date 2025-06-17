`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Andy Siu
// 
// Create Date: 06/17/2025 08:54:11 AM
// Design Name: Switch LED Interface
// Module Name: switch_led_interface
// Project Name: Lab 1: Switch LED Interface
// Target Devices: Nexys A7 100T
// Tool Versions: 
// Description: This project will turn on leds to their respectively mirror mapped switches
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module switch_led_interface(
    input wire [15:0] sw,    //declare 16-bit switch input as a wire
    output wire [15:0] led   //declare 16-bit led output as a wire
    );
    assign led = sw;
endmodule
