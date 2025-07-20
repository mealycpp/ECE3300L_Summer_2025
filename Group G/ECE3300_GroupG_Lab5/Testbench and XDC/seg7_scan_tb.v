`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2025 06:41:27 PM
// Design Name: 
// Module Name: seg7_scan_tb
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


module seg7_scan_tb();
    reg CLK = 0;
    reg [3:0] digit0 = 4'd3;
    reg [3:0] digit1 = 4'd7;
    wire [1:0] AN;
    wire [6:0] SEG;

    seg7_scan uut (
        .CLK(CLK),
        .digit0(digit0),
        .digit1(digit1),
        .AN(AN),
        .SEG(SEG)
    );

    // Simulate 100MHz clock
    always #5 CLK = ~CLK;

    initial begin
        $display("Testing 7-Segment Scanner");
        #200000;  // Enough time to see digit alternation
        $stop;
    end
endmodule
