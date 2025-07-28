`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 04:37:39 AM
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

    wire [7:0] result;

alu dut(
    .A(A),
    .B(B),
    .ctrl(ctrl),
    .result(result)
    );
    
    initial begin
    A = 4'd6;
    B = 4'd11;
    ctrl = 2'b00;   //adding
    #200            //result 17
    
    A = 4'd12;
    B = 4'd4;
    ctrl = 2'b01;   //subtraction
    #200            //result 8
    
    A = 4'd5;
    B = 4'd15;
    ctrl = 2'b01;   //subtraction into negative
    #200            //result 246
    
    A = 4'd5;
    B = 4'd15;
    ctrl = 2'b10;   //subtraction w underflow
    #200            //result 0
    
    A = 4'd1;
    B = 4'd1;
    ctrl = 2'b11;   //defult case 0
    #200           
    
    #1_000_000
    $finish;
    end
endmodule
