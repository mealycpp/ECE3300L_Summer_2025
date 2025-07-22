`timescale 1ns / 1ps
module mux32x1(
    input  wire [31:0] count,
    input  wire [4:0] sel,
    output wire  clk_out
);
    assign clk_out = count[sel];
endmodule
