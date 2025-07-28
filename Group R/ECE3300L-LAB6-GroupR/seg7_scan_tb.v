`timescale 1ns / 1ps


module seg7_scan_tb;

    reg clk = 0;
    reg [3:0] digit0 = 4'd5;
    reg [3:0] digit1 = 4'd1;
    reg [3:0] digit2 = 4'd7;
    wire [6:0] seg;
    wire [3:0] an;

    seg7_scan uut (
        .clk(clk),
        .digit0(digit0),
        .digit1(digit1),
        .digit2(digit2),
        .seg(seg),
        .an(an)
    );

    always #5 clk = ~clk;  // 100 MHz clock (10 ns period)

    initial begin
        $display("7-Segment Scan Testbench Start");
        #1000000; // Wait for ~1ms to see digit rotation
        $display("Test Complete: Check an/seg in waveform viewer");
        $finish;
    end
endmodule
