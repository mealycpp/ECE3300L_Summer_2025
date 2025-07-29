//jaden

module clock_divider(input clk, input [4:0] sel, output clk_div);
    reg [31:0] cnt = 0;
    assign clk_div = cnt[sel];
    always @(posedge clk)
        cnt <= cnt + 1;
endmodule
