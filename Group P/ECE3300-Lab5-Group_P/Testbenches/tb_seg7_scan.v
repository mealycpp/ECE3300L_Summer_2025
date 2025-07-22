`timescale 1ns / 1ps
module tb_seg7_scan;

reg clk_fast = 0;
reg rst_n;
reg [3:0] units_val;
reg [3:0] tens_val;
wire [6:0] seg_pins;
wire dp;
wire [1:0] anodes;

seg7_scan uut (
    .clk_fast(clk_fast),
    .rst_n(rst_n),
    .units_val(units_val),
    .tens_val(tens_val),
    .seg_pins(seg_pins),
    .dp(dp),
    .anodes(anodes)
);

always #5 clk_fast = ~clk_fast;

initial begin
    $display("Testing seg7 scan");
    rst_n = 0; #20; rst_n = 1;
    #100;
    assign units_val = 4'd3;
    assign tens_val = 4'd1;
    #100;
    assign units_val = 4'd6;
    assign tens_val = 4'd2;
    #100;
    assign units_val = 4'd9;
    assign tens_val = 4'd7;
    $finish;
end

endmodule
