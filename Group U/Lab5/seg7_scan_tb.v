`timescale 1ns / 1ps


module seg7_scan_tb();
    reg clk = 0;
    reg rst_n;
    reg [3:0] lsb0, lsb1;
    wire [6:0] seg;
    wire [1:0] an;

    seg7_scan uut (
        .clk(clk),
        .rst_n(rst_n),
        .lsb0(lsb0),
        .lsb1(lsb1),
        .seg(seg),
        .an(an)
    );

    always #5 clk = ~clk;

    initial begin
        rst_n = 0; lsb0 = 4'd3; lsb1 = 4'd7; #20;
        rst_n = 1; #500;
        $finish;
    end
endmodule