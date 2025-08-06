`timescale 1ns / 1ps

module seg7_scan8_tb();
    reg clk = 0;
    wire [7:0] an;
    wire [6:0] seg;

    reg [6:0] s0, s1, s2, s3, s4, s5, s6, s7;

    seg7_scan8 uut (
        .clk_1khz(clk),
        .seg0(s0),
        .seg1(s1),
        .seg2(s2),
        .seg3(s3),
        .seg4(s4),
        .seg5(s5),
        .seg6(s6),
        .seg7(s7),
        .an(an),
        .seg(seg)
    );

    always #500 clk = ~clk;

    initial begin
        s0 = 7'b1000000; // 0
        s1 = 7'b1111001; // 1
        s2 = 7'b0100100; // 2
        s3 = 7'b0110000; // 3
        s4 = 7'b0011001; // 4
        s5 = 7'b0010010; // 5
        s6 = 7'b0000010; // 6
        s7 = 7'b1111000; // 7

        #20000; // 20 ms
        $finish;
    end
endmodule
