module clock_divider_fixed(
    input wire clk_in,
    output reg clk_1kHz = 0,
    output reg clk_demo = 0
);
    parameter DIV_VALUE = 26'd50_000_000;

    reg [25:0] count_1kHz = 0;
    reg [15:0] count_demo = 0;

    always @(posedge clk_in) begin
        count_1kHz <= count_1kHz + 1;
        if (count_1kHz >= DIV_VALUE/1000) begin
            count_1kHz <= 0;
            clk_1kHz <= ~clk_1kHz;
        end
    end

    always @(posedge clk_1kHz) begin
        count_demo <= count_demo + 1;
        if (count_demo >= 500) begin // ~2 Hz toggle
            count_demo <= 0;
            clk_demo <= ~clk_demo;
        end
    end
endmodule