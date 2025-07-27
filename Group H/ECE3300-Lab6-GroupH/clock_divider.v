`timescale 1ns / 1ps

module clock_divider(
    input clk,
    input rst_n,
    input [4:0] sel,
    output clk_div
);
    reg [31:0] cnt;

    // 32-bit free-running counter
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            cnt <= 32'd0;
        else
            cnt <= cnt + 1;
    end

    // Use the 'sel' input to pick one bit from the counter as the output clock
    assign clk_div = cnt[sel];

endmodule