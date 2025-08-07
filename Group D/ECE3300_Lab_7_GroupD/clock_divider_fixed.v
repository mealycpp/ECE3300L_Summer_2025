//jaden

module clock_divider_fixed(
    input clk,
    output clk_1khz,
    output clk_demo
);
    reg [25:0] cnt1 = 0;
    reg [25:0] cnt2 = 0;

    always @(posedge clk) begin
        cnt1 <= cnt1 + 1;
        cnt2 <= cnt2 + 1;
    end

    assign clk_1khz = cnt1[15];      // ~1 kHz
    assign clk_demo = cnt2[25];      // ~2 Hz
endmodule
