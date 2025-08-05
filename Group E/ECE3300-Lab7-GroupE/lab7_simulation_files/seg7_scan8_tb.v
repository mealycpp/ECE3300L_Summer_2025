`timescale 1us / 1ns   
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

    reg        clk = 0;            
    wire [7:0] AN;                
    wire [6:0] SEG;          

    reg [6:0] d0, d1, d2, d3, d4, d5, d6, d7;

    always #500 clk = ~clk;

    seg7_scan8 dut (
        .clk_1kHz (clk),
        .d0       (d0),
        .d1       (d1),
        .d2       (d2),
        .d3       (d3),
        .d4       (d4),
        .d5       (d5),
        .d6       (d6),
        .d7       (d7),
        .AN       (AN),
        .SEG      (SEG)
    );

    initial begin
        d0 = 7'b1000000; // 0
        d1 = 7'b1111001; // 1
        d2 = 7'b0100100; // 2
        d3 = 7'b0110000; // 3
        d4 = 7'b0011001; // 4
        d5 = 7'b0010010; // 5
        d6 = 7'b0000010; // 6
        d7 = 7'b1111000; // 7

        #20000; // 20 ms
        $finish;
    end
endmodule

