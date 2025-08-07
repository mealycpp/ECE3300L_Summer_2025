`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 07:47:46 PM
// Design Name: 
// Module Name: seg7_scan8_tb
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


module seg7_scan8_tb;
    reg clk_1khz;
    reg [6:0] seg0, seg1, seg2, seg3, seg4, seg5, seg6, seg7;
    wire [7:0] an;
    wire [6:0] seg;

    seg7_scan8 uut (
        .clk_1khz(clk_1khz),
        .seg0(seg0), .seg1(seg1), .seg2(seg2), .seg3(seg3),
        .seg4(seg4), .seg5(seg5), .seg6(seg6), .seg7(seg7),
        .an(an),
        .seg(seg)
    );

    initial begin
        clk_1khz = 0;
        forever #500 clk_1khz = ~clk_1khz;
    end

    initial begin
        seg0 = 7'h3F; seg1 = 7'h06; seg2 = 7'h5B; seg3 = 7'h4F;
        seg4 = 7'h66; seg5 = 7'h6D; seg6 = 7'h7D; seg7 = 7'h07;
        #8000;
        $finish;
    end
endmodule

