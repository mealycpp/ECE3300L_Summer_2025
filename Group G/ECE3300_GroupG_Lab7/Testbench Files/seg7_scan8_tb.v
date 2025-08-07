`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 08:03:48 PM
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
    reg [6:0] segs [7:0];
    wire [7:0] an;
    wire [6:0] seg;

    seg7_scan8 uut (
        .CLK_1KHZ(clk_1khz),
        .SEG0(segs[0]),
        .SEG1(segs[1]),
        .SEG2(segs[2]),
        .SEG3(segs[3]),
        .SEG4(segs[4]),
        .SEG5(segs[5]),
        .SEG6(segs[6]),
        .SEG7(segs[7]),
        .AN(an),
        .SEG(seg)
    );

    initial begin
        clk_1khz = 0;
        forever #500 clk_1khz = ~clk_1khz;
    end

    initial begin
        $display("Testing seg7_scan8");
        segs[0] = 7'b0000001; // display 0
        segs[1] = 7'b1001111; // display 1
        segs[2] = 7'b0010010; // display 2
        segs[3] = 7'b0000110; // display 3
        segs[4] = 7'b1001100; // display 4
        segs[5] = 7'b0100100; // display 5
        segs[6] = 7'b0100000; // display 6
        segs[7] = 7'b0001111; // display 7
        #10000;
        $finish;
    end
endmodule
