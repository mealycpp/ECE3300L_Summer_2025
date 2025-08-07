`timescale 1ns / 1ps
module seg7_scan8_tb;
    reg clk_1kHz = 0;
    reg rst_n = 1;
    reg [6:0] seg0 = 7'b1000000; // 0
    reg [6:0] seg1 = 7'b1111001; // 1
    reg [6:0] seg2 = 7'b0100100; // 2
    reg [6:0] seg3 = 7'b0110000; // 3
    wire [6:0] seg;
    wire [7:0] an;

    seg7_scan8 uut(
        .clk_1kHz(clk_1kHz),
        .rst_n(rst_n),
        .seg0(seg0),
        .seg1(seg1),
        .seg2(seg2),
        .seg3(seg3),
        .seg(seg),
        .an(an)
    );

    always #500 clk_1kHz = ~clk_1kHz; 

    initial begin
        $display("Testing seg7_scan8 4-digit scan cycle");
        $monitor("time=%0t an=%b seg=%b", $time, an, seg);
        rst_n = 0; #1000;
        rst_n = 1;
        #8000; 
        $finish;
    end
endmodule



