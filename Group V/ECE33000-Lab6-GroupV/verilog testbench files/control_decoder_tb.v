`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 07:47:08 PM
// Design Name: 
// Module Name: control_decoder_tb
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


module control_decoder_tb(
    );
    reg [3:0] nibble;
    wire [3:0]ctrl_nibble;
    integer i;
    control_decoder uut(
    .nibble(nibble),
    .ctrl_nibble(ctrl_nibble)
    );
    initial begin
    nibble = 0;
    #20;
    for (i = 0; i < 16; i = i + 1)begin
    nibble = i;
    #10;
    end
    #20;
    $finish;
    end
endmodule
