`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 07/16/2025 12:07:51 PM
// Design Name: 
// Module Name: seg7_scan_tb
// Project Name: seg7_scan_tb
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
    reg clk = 0;
    reg rst_n;
    reg [3:0] digit0, digit1;
    wire [6:0] seg;
    wire [1:0] an;

    seg7_scan uut (
        .clk(clk),
        .rst_n(rst_n),
        .digit0(digit0),
        .digit1(digit1),
        .seg(seg),
        .an(an)
    );

    always #5 clk = ~clk;

    initial begin
        rst_n = 0; digit0 = 4'd3; digit1 = 4'd7; #20;
        rst_n = 1; #500;
        $finish;
    end
endmodule
