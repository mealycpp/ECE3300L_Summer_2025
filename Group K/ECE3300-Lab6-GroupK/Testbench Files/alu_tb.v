`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Andy Siu
// 
// Create Date: 07/28/2025 06:30:45 PM
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

    alu uut (
        .A(A),
        .B(B),
        .ctrl(ctrl),
        .result(result)
    );

    integer i, j;

    initial begin
        $display("Starting ALU test...");
        $display("Time\tCTRL\tA\tB\t|\tRESULT");

        // Test Addition: ctrl = 2'b00
        ctrl = 2'b00;
        for (i = 0; i <= 9; i = i + 1) begin
            for (j = 0; j <= 9; j = j + 1) begin
                A = i;
                B = j;
                #10; 
                $display("%0dns\tADD\t%0d\t%0d\t|\t%0d", $time, A, B, result);
            end
        end

        // Test Subtraction: ctrl = 2'b01
        ctrl = 2'b01;
        for (i = 0; i <= 9; i = i + 1) begin
            for (j = 0; j <= 9; j = j + 1) begin
                A = i;
                B = j;
                #10;
                $display("%0dns\tSUB\t%0d\t%0d\t|\t%0d", $time, A, B, result);
            end
        end

        $display("ALU test completed.");
        $stop;
    end

endmodule

