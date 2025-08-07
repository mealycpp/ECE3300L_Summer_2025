`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2025 03:18:06 PM
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


module seg7_scan8_tb(
    );
reg clk;
reg rst_n;
reg clk_1kHz;
reg[3:0] dig0, dig1, dig2, dig3;
wire[7:0]an;
wire[6:0]seg;

seg7_scan8 uut(
    .clk(clk),
    .rst_n(rst_n),
    .clk_1kHz(clk_1kHz),
    .dig0(dig0),
    .dig1(dig1),
    .dig2(dig2),
    .dig3(dig3),
    .an(an),
    .seg(seg)
);

initial begin
    //ignore clk, unused
    clk = 0;

    clk_1kHz = 0;
    rst_n = 0;
    forever #5 clk_1kHz = ~clk_1kHz;
end

initial begin
#20;
rst_n = 1;
dig0 = 4'hA;
dig1 = 4'hE;
dig2 = 4'h8;
dig3 = 4'h1;

#80;
rst_n = 0;
#20;
rst_n = 1;

dig0 = 4'hB;
dig1 = 4'h4;
dig2 = 4'h2;
dig3 = 4'hF;

#80;
$finish;
end

endmodule
