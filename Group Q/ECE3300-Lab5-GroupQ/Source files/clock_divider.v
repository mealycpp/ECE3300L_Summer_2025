`timescale 1ns / 1ps

module clock_divider(
    input clk,
    output reg [31:0] cnt = 0
);
    always @(posedge clk)
        cnt <= cnt + 1;
endmodule
