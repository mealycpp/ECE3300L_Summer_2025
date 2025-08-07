`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 03:34:12 PM
// Design Name: 
// Module Name: clock_divider_fixed
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clock_divider_fixed(
    input wire clk,
    output reg clk_1kHz = 0,
    output reg clk_demo = 0
);

    reg [15:0] count_1kHz = 0;
    reg [25:0] count_demo = 0;

    always @(posedge clk) begin
        // ~1 kHz from 100 MHz
        if (count_1kHz == 49999) begin
            count_1kHz <= 0;
            clk_1kHz <= ~clk_1kHz;
        end else begin
            count_1kHz <= count_1kHz + 1;
        end

        // ~2 Hz from 100 MHz
        if (count_demo == 24_999_999) begin
            count_demo <= 0;
            clk_demo <= ~clk_demo;
        end else begin
            count_demo <= count_demo + 1;
        end
    end

endmodule
