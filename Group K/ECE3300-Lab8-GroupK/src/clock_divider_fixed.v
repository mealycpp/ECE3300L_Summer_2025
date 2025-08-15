`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Andy Siu
// 
// Create Date: 08/14/2025 03:21:11 PM
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


module clock_divider_fixed #(
    parameter integer INPUT_HZ = 100_000_000, // Input clock frequency
    parameter integer TICK1_HZ = 1_000,       // 1kHz target frequency
    parameter integer PWM_HZ   = 20_000       // PWM frequency
)(
    input  wire clk_in,
    input  wire rst_n,
    output reg  clk_1k,
    output reg  clk_pwm
);

    localparam integer DIV1H  = (INPUT_HZ / TICK1_HZ) / 2;
    localparam integer DIVPMH = (INPUT_HZ / PWM_HZ) / 2;

    reg [$clog2(DIV1H):0]  c1;
    reg [$clog2(DIVPMH):0] c2;

    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            c1      <= 0;
            clk_1k  <= 0;
            c2      <= 0;
            clk_pwm <= 0;
        end
        else begin
            if (c1 == DIV1H - 1) begin
                c1 <= 0;
                clk_1k <= ~clk_1k;
            end
            else begin
                c1 <= c1 + 1;
            end

            if (c2 == DIVPMH - 1) begin 
                c2 <= 0;
                clk_pwm <= ~clk_pwm;
            end
            else begin
                c2 <= c2 + 1;
            end
        end
    end

endmodule