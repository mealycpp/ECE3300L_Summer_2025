`timescale 1ns / 1ps

module seg7_scan8(
    input wire clk_1kHz,              // ~1 kHz clock for display refresh
    input wire [6:0] seg_data[7:0],   // 7-segment values for digits 0–7
    output reg [6:0] seg,             // active-high segment output
    output reg [7:0] an               // active-low digit enable
);

    reg [2:0] scan_index = 3'b000;

    always @(posedge clk_1kHz) begin
        scan_index <= scan_index + 1;
    end

    always @(*) begin
        seg = seg_data[scan_index];
        an = 8'b1111_111_
