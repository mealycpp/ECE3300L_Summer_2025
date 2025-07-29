`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 08:57:49 PM
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

    // Testbench signals
    reg [3:0] A;
    reg [3:0] B;
    reg [1:0] ctrl;
    wire [7:0] result;

    // Instantiate the ALU
    alu uut (
        .A(A),
        .B(B),
        .ctrl(ctrl),
        .result(result)
    );

    initial begin
        // Display header
        $display("Time\tctrl\tA\tB\tResult");

        // Monitor outputs
        $monitor("%0t\t%b\t%0d\t%0d\t%0d", $time, ctrl, A, B, result);

        // Test case 1: Add (A=3, B=4)
        A = 4'd3; B = 4'd4; ctrl = 2'b00;
        #10;

        // Test case 2: Add (A=9, B=6)
        A = 4'd9; B = 4'd6; ctrl = 2'b00;
        #10;

        // Test case 3: Subtract (A=7, B=2)
        A = 4'd7; B = 4'd2; ctrl = 2'b01;
        #10;

        // Test case 4: Subtract with underflow (A=2, B=5)
        A = 4'd2; B = 4'd5; ctrl = 2'b01;
        #10;

        // Test case 5: Default case (ctrl = 2'b10)
        A = 4'd8; B = 4'd3; ctrl = 2'b10;
        #10;

        // Test case 6: Default case (ctrl = 2'b11)
        A = 4'd1; B = 4'd1; ctrl = 2'b11;
        #10;

        // End simulation
        $finish;
    end

endmodule