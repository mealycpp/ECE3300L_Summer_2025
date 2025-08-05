`timescale 1ns / 1ps
module clock_divider_fixed(
    input wire clk,            
    output reg clk_1kHz = 1'b0,
    output reg clk_2Hz = 1'b0
);

    localparam COUNT_1KHZ_MAX = 16'd50_000;
    reg [15:0] counter_1kHz = 16'd0;

    always @(posedge clk) begin
        if (counter_1kHz == COUNT_1KHZ_MAX - 1) begin
            counter_1kHz <= 16'd0;
            clk_1kHz <= ~clk_1kHz;
        end else begin
            counter_1kHz <= counter_1kHz + 1;
        end
    end

    localparam COUNT_2HZ_MAX = 25'd25_000_000;
    reg [24:0] counter_2Hz = 25'd0;

    always @(posedge clk) begin
        if (counter_2Hz == COUNT_2HZ_MAX - 1) begin
            counter_2Hz <= 25'd0;
            clk_2Hz <= ~clk_2Hz;
        end else begin
            counter_2Hz <= counter_2Hz + 1;
        end
    end
endmodule