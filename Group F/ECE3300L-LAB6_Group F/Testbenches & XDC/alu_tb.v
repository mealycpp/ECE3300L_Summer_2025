`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2025 03:49:24 PM
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


module alu_tb(
);

    reg [3:0] A;
    reg [3:0] B;
    reg [1:0] ctrl;
    wire [7:0] result;
    
    alu uut (
        .A(A),
        .B(B),
        .ctrl(ctrl),
        .result(result)
        );
        
    initial begin        
        // Test case 1: Addition
        A = 4'd3; B = 4'd5; ctrl = 3'b000; #10;
        // Test case 2: Subtraction
        A = 4'd7; B = 4'd2; ctrl = 3'b001; #10;
        // Test case 3: Negative
        A = 4'd4; B = 4'd7; ctrl = 3'b001; #10;
        // Test case 4: Zero
        A = 4'd0; B = 4'd0; ctrl = 3'b000; #10;
    end
endmodule
