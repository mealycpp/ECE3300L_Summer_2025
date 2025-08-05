`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 08/04/2025 11:00:48 AM
// Design Name: 
// Module Name: seg7_scan8
// Project Name: seg7_scan8
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

module seg7_scan8(
    input  wire        clk_1kHz,
    input  wire [6:0]  d0, d1, d2, d3, d4, d5, d6, d7,  // segment codes (active-low)
    output reg  [7:0]  AN  = 8'b1111_1111,              // active-low enables
    output reg  [6:0]  SEG = 7'b111_1111               // active-low segments
);
    reg [2:0] scan_cnt = 3'd0;

    // advance scan index at ~1 kHz
    always @(posedge clk_1kHz) begin
        scan_cnt <= scan_cnt + 3'd1;
    end

    // select digit and its segment pattern
    always @(*) begin
        case (scan_cnt)
            3'd0: begin AN = 8'b1111_1110; SEG = d0; end // AN0 (rightmost)
            3'd1: begin AN = 8'b1111_1101; SEG = d1; end // AN1
            3'd2: begin AN = 8'b1111_1011; SEG = d2; end // AN2
            3'd3: begin AN = 8'b1111_0111; SEG = d3; end // AN3
            3'd4: begin AN = 8'b1110_1111; SEG = d4; end // AN4
            3'd5: begin AN = 8'b1101_1111; SEG = d5; end // AN5
            3'd6: begin AN = 8'b1011_1111; SEG = d6; end // AN6
            3'd7: begin AN = 8'b0111_1111; SEG = d7; end // AN7
            default: begin AN = 8'b1111_1111; SEG = 7'b111_1111; end
        endcase
    end
endmodule
