`timescale 1ns / 1ps

// clock_divider_fixed.v
// for the two seperate speeds rather than a sel
module clock_divider_fixed(
    input clk,
    input rst_n,
    output reg clk_scan, // ~1kHz
    output reg clk_demo  // ~2Hz
);

//scan and demo counter for clock output
    reg [25:0] scan_cnt;
    reg [25:0] demo_cnt;

//if reset then all clock goes low
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            scan_cnt <= 0;
            demo_cnt <= 0;
            clk_scan <= 0;
            clk_demo <= 0;
        end else begin
            // ~1kHz from 100MHz clock (divide by 100000)
            if (scan_cnt == 100_000) begin
                scan_cnt <= 0;
                clk_scan <= ~clk_scan;
            end else begin
                scan_cnt <= scan_cnt + 1;
            end

            // ~2Hz from 100MHz clock (divide by 25_000_000)
            if (demo_cnt == 25_000_000) begin
                demo_cnt <= 0;
                clk_demo <= ~clk_demo;
            end else begin
                demo_cnt <= demo_cnt + 1;
            end
        end
    end
endmodule