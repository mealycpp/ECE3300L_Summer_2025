`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/27/2025 04:49:50 PM
// Design Name: 
// Module Name: control_decoder
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
module control_decoder(
    input wire Sw4,
    input wire Sw3,
    input wire Sw2,
    input wire Sw1,
    output [3:0] ctrl_nibble
    );
    
    wire [3:0] nibble = {Sw1, Sw2, Sw3, Sw4};
    
    assign ctrl_nibble = nibble;
endmodule
