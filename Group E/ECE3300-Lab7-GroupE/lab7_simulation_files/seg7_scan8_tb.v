`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 08/04/2025 12:56:51 PM
// Design Name: 
// Module Name: seg7_scan8_tb
// Project Name: seg7_scan8_tb
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

module seg7_scan8_tb;

    reg clk = 0;
    wire [7:0] an;
    wire [6:0] seg;

    reg [6:0] hex_seg [7:0];

    seg7_scan8 uut (
        .clk(clk),
        .hex_seg(hex_seg),
        .an(an),
        .seg(seg)
    );

    always #500 clk = ~clk; // 1 kHz

    initial begin
        hex_seg[0] = 7'b1000000;
        hex_seg[1] = 7'b1111001;
        hex_seg[2] = 7'b0100100;
        hex_seg[3] = 7'b0110000;
        hex_seg[4] = 7'b0011001;
        hex_seg[5] = 7'b0010010;
        hex_seg[6] = 7'b0000010;
        hex_seg[7] = 7'b1111000;

        #10000;
        $finish;
    end
endmodule
