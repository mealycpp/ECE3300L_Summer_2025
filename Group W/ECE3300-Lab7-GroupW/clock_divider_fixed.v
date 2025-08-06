`timescale 1ns / 1ps

module clock_divider_fixed(
    input wire clk,           // 100 MHz input clock
    input wire rst_n,         // Active-low reset
    output reg clk_out        // Slower output clock
);

    parameter DIV_VALUE = 26'd50_000;  // Half-period count
    reg [25:0] cnt;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt <= 0;
            clk_out <= 0;
        end else begin
            if (cnt == DIV_VALUE - 1) begin
                cnt <= 0;
                clk_out <= ~clk_out;  // Toggle output clock
            end else begin
                cnt <= cnt + 1;
            end
        end
    end

endmodule
