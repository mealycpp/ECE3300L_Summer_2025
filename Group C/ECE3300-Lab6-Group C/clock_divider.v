module clock_divider(
    input clk,
    input BTN0,
    input [4:0] sel,
    output reg [31:0] cnt,
    output clk_div
);
    always @(posedge clk or negedge BTN0) begin
        if (!BTN0) cnt <= 32'd0;
        else cnt <= cnt + 1;
    end

    assign clk_div = cnt[sel];
endmodule
