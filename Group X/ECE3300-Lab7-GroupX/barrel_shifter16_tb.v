`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 07:44:09 PM
// Design Name: 
// Module Name: barrel_shifter16_tb
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


module barrel_shifter16_tb;
    reg [15:0] DATA_IN;
    reg [3:0] SHAMT;
    reg DIR;
    reg ROTATE;
    wire [15:0] DATA_OUT;

    barrel_shifter16 uut (
        .DATA_IN(DATA_IN),
        .SHAMT(SHAMT),
        .DIR(DIR),
        .ROTATE(ROTATE),
        .DATA_OUT(DATA_OUT)
    );

    initial begin
        DATA_IN = 16'hA5A5; SHAMT = 4'd1; DIR = 0; ROTATE = 0; #10;
        SHAMT = 4'd2; DIR = 1; ROTATE = 0; #10;
        SHAMT = 4'd4; DIR = 0; ROTATE = 1; #10;
        SHAMT = 4'd8; DIR = 1; ROTATE = 1; #10;
        SHAMT = 4'd3; DIR = 0; ROTATE = 0; #10;
        #10;
        $finish;
    end
endmodule

