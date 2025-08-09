`timescale 1ns / 1ps

module clock_divider_fixed(
    input wire clk,          // 100 MHz input clock
    input wire rst,          // active-high reset
    output reg clk_1kHz,     // ~1kHz output for 7-segment scanning
    output reg clk_demo      // ~2Hz output for barrel shift
);

    parameter DIV_1KHZ = 26'd50_000;       // 100 MHz / 50,000 = 2 kHz → toggled = 1 kHz
    parameter DIV_DEMO = 26'd25_000_000;   // 100 MHz / 25M = 2 Hz → toggled = 1 Hz

    reg [25:0] counter_1kHz = 0;
    reg [25:0] counter_demo = 0;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter_1kHz <= 0;
            clk_1kHz <= 0;
        end else if (counter_1kHz == DIV_1KHZ - 1) begin
            counter_1kHz <= 0;
            clk_1kHz <= ~clk_1kHz;
        end else begin
            counter_1kHz <= counter_1kHz + 1;
        end
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter_demo <= 0;
            clk_demo <= 0;
        end else if (counter_demo == DIV_DEMO - 1) begin
            counter_demo <= 0;
            clk_demo <= ~clk_demo;
        end else begin
            counter_demo <= counter_demo + 1;
        end
    end

endmodule
