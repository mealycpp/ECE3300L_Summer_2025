`timescale 1ns / 1ps

module seg7_scan8(
                    input clk_1khz,
                    input [6:0] seg0, seg1, seg2, seg3, seg4, seg5, seg6, seg7,
                    output reg [7:0] an,
                    output reg [6:0] seg
                );
                
                reg [2:0] scan_cnt = 0;
                always @(posedge clk_1khz) begin
                    scan_cnt <= scan_cnt + 1;
                end
                always @(*) begin
                    case(scan_cnt)
                        3'd0: begin an = 8'b11111110; seg = seg0; end // rightmost digit
                        3'd1: begin an = 8'b11111101; seg = seg1; end
                        3'd2: begin an = 8'b11111011; seg = seg2; end
                        3'd3: begin an = 8'b11110111; seg = seg3; end
                        3'd4: begin an = 8'b11101111; seg = seg4; end // blank
                        3'd5: begin an = 8'b11011111; seg = seg5; end // blank
                        3'd6: begin an = 8'b10111111; seg = seg6; end // blank
                        3'd7: begin an = 8'b01111111; seg = seg7; end // blank
                    endcase
                end
endmodule
