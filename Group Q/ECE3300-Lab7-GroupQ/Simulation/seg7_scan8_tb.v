`timescale 1ns/1ps
module seg7_scan8_tb;

    reg clk, rst;
    reg [15:0] value;
    wire [6:0] seg;
    wire [7:0] an;

    // DUT
    seg7_scan8 uut (
        .clk(clk),
        .rst(rst),
        .value(value),
        .seg(seg),
        .an(an)
    );

    // Clock generator (10 ns period = 100 MHz for sim)
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("seg7_scan8_tb.vcd");
        $dumpvars(0, seg7_scan8_tb);

        // Reset
        rst = 1;
        value = 16'h1234;
        #20;
        rst = 0;

        // Change value over time
        #1000 value = 16'hABCD;
        #1000 value = 16'h0F0F;
        #1000 value = 16'hFACE;

        #2000 $stop;
    end
endmodule