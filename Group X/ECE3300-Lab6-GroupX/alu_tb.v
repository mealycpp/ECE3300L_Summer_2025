`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 10:53:50 PM
// Design Name: 
// Module Name: alu_tb
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


module alu_tb;
    reg [3:0] A;
    reg [3:0] B;
    reg [1:0] ctrl;
    wire[7:0] out;

    alu uut (
        .A(A),
        .B(B),
        .ctrl(ctrl),
        .out(out)
    );

    initial begin
        // add tests
        A = 4'd7; 
        B = 4'd5; 
        ctrl = 2'b00; 
        #10;
        A = 4'd9; 
        B = 4'd9; 
        ctrl = 2'b00; 
        #10;
        // subtract with wrap
        A = 4'd3; 
        B = 4'd8; 
        ctrl = 2'b01;
        #10;
        A = 4'd0; 
        B = 4'd1; 
        ctrl = 2'b01; 
        #10;
        // invalid ctrl -> zero
        A = 4'd4; 
        B = 4'd2; 
        ctrl = 2'b10; 
        #10;
        ctrl = 2'b11;
        #10;

        $finish;
    end
endmodule

