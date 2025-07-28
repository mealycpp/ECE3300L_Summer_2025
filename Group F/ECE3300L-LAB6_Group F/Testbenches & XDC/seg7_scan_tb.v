`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2025 07:03:19 PM
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
// seg7_scan_tb.v

module seg7_scan_tb;
    reg clk, reset;
    reg [15:0] data_in;
    wire [3:0] an;
    wire [6:0] seg;

    seg7_scan uut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .an(an),
        .seg(seg)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        reset = 1; data_in = 16'h1234; #10;
        reset = 0; #10;
        data_in = 16'hABCD; #20;
        data_in = 16'h0000; #20;
        data_in = 16'hFFFF; #20;
        $finish;
    end

    initial begin
        $monitor("Time=%0t data_in=%h an=%b seg=%b", $time, data_in, an, seg);
    end
endmodule


