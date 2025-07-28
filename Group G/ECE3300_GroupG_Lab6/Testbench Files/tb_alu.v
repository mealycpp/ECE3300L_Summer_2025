`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 01:57:01 PM
// Design Name: 
// Module Name: tb_alu
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


module tb_alu();
    reg [3:0] A, B;
    reg [6:5] ctrl;
    wire [7:0] result;

    alu uut (.A(A), .B(B), .ctrl(ctrl), .result(result));

    initial begin
        A = 4'd3; B = 4'd5; ctrl = 2'b00; #10;
        A = 4'd9; B = 4'd2; ctrl = 2'b01; #10;
        A = 4'd6; B = 4'd7; ctrl = 2'b10; #10; // undefined op
        $stop;
    end
endmodule
