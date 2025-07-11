`timescale 1ns / 1ps
module sec7_top(
input clk,
    input rst_n,
    input [15:0] SW,
    output wire [6:0] Cnode,
    output dp,
    output [7:0] AN,
    output wire[15:0] LED
);

wire [31:0]sw_in;
assign sw_in = {SW, SW}; 
assign LED = SW;

seg7_driver driver(
.clk(clk),
.rst_n(rst_n),
.SW(sw_in),
.Cnode(Cnode),
.dp(dp),
.AN(AN)
);
endmodule


