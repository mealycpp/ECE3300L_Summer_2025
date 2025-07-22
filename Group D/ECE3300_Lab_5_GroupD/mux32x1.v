//jaden

module mux32x1 (
    input [31:0] cnt,
    input [4:0] sel,
    output clk_div
);
    assign clk_div = cnt[sel];
endmodule
