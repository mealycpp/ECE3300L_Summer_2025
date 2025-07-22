`timescale 1ns/1ps
module sevenseg_driver (
    input  wire       clk,
    input  wire       rst_n,
    input  wire [3:0] units,
    input  wire [3:0] tens,
    output reg  [6:0] SEG,
    output reg  [1:0] AN
);
    // small prescaler for 1 kHz toggle
    reg [15:0] scan_ctr;
    always @(posedge clk or negedge rst_n)
        scan_ctr <= !rst_n ? 16'd0 : scan_ctr + 16'd1;

    wire sel = scan_ctr[15];

    // BCD to seven-segment lookup (active-low)
    function [6:0] seg_lut (input [3:0] n);
        case (n)
            4'd0: seg_lut = 7'b0000001;
            4'd1: seg_lut = 7'b1001111;
            4'd2: seg_lut = 7'b0010010;
            4'd3: seg_lut = 7'b0000110;
            4'd4: seg_lut = 7'b1001100;
            4'd5: seg_lut = 7'b0100100;
            4'd6: seg_lut = 7'b0100000;
            4'd7: seg_lut = 7'b0001111;
            4'd8: seg_lut = 7'b0000000;
            4'd9: seg_lut = 7'b0001100;
            default: seg_lut = 7'b1111111;
        endcase
    endfunction

    always @(*) begin
        if (sel) begin
            SEG = seg_lut(tens);
            AN  = 2'b01;       // enable left digit (AN1)
        end else begin
            SEG = seg_lut(units);
            AN  = 2'b10;       // enable right digit (AN0)
        end
    end
endmodule