`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 07:52:54 PM
// Design Name: 
// Module Name: seg7_scan8
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


module seg7_scan8(
    input CLK_1KHZ,
    input [6:0] SEG0, SEG1, SEG2, SEG3, SEG4, SEG5, SEG6, SEG7,
    output reg [7:0] AN,
    output reg [6:0] SEG
);
    reg [2:0] scan_cnt = 0;
    always @(posedge CLK_1KHZ) begin
        scan_cnt <= scan_cnt + 1;
    end
    always @(*) begin
        case(scan_cnt)
            3'd0: begin AN = 8'b11111110; SEG = SEG0; end // rightmost digit
            3'd1: begin AN = 8'b11111101; SEG = SEG1; end
            3'd2: begin AN = 8'b11111011; SEG = SEG2; end
            3'd3: begin AN = 8'b11110111; SEG = SEG3; end
            3'd4: begin AN = 8'b11101111; SEG = SEG4; end // blank
            3'd5: begin AN = 8'b11011111; SEG = SEG5; end // blank
            3'd6: begin AN = 8'b10111111; SEG = SEG6; end // blank
            3'd7: begin AN = 8'b01111111; SEG = SEG7; end // blank
        endcase
    end
endmodule
