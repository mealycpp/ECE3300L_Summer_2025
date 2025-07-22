module mux32x1(
    input [31:0] cnt,
    input [4:0] sel,
    output clk_out
);
    //mux assign clk_out to "array" index sel
    assign clk_out = cnt[sel];
endmodule