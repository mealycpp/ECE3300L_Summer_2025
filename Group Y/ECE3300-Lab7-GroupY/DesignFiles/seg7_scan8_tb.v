`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 10:00:17 PM
// Design Name: 
// Module Name: seg7_scan8_tb
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


module seg7_scan8_tb;
reg clk;
    reg rst;
    reg [15:0] bits;
    wire [6:0] SEG;
    wire [7:0] AN;

    seg7_scan8 uut (
        .clk(clk),
        .rst(rst),
        .bits(bits),
        .SEG(SEG),
        .AN(AN)
    );


    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 0;
        bits = 16'h1234; 

        #20;
        rst = 1;

        #200000; 
        bits = 16'hABCD;
        #200000;

        bits = 16'hF00D;
        #200000;

        $stop;
    end

    initial begin
        $display("Time\t\tclk\trst\tbits\t\tSEG\t\tAN");
        $monitor("%0t\t%b\t%b\t%h\t%b\t%b", $time, clk, rst, bits, SEG, AN);
    end

endmodule
