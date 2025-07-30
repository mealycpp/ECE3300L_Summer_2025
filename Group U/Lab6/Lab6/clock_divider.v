module clock_divider(
    input clk,
    input BTN0,
    input [4:0] sel,
    output wire clk_div,
    output reg [31:0] cnt = 0
);
    always @(posedge clk) begin
        if (!BTN0)
            cnt <= 0;
        else
            cnt <= cnt + 1;
    end

    assign clk_div = cnt[sel];
endmodule
