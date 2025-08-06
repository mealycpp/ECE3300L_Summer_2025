`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 08:47:07 PM
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


module seg7_scan8_tb();
    reg  clk_1kHz = 0;
    reg [6:0] SEG0, SEG1, SEG2, SEG3, SEG4, SEG5, SEG6, SEG7;
    wire [7:0] AN;                
    wire [6:0] SEG;          

    seg7_scan8 dut (
        .CLK_1KHZ(clk_1kHz),
        .SEG0(SEG0), .SEG1(SEG1), .SEG2(SEG2), .SEG3(SEG3),
        .SEG4(SEG4), .SEG5(SEG5), .SEG6(SEG6), .SEG7(SEG7),
        .AN(AN),
        .SEG(SEG)
    );

    always #500_000 clk_1kHz = ~clk_1kHz;


      initial begin
            SEG0 = 7'b1000000; // 0
            SEG1 = 7'b1111001; // 1
            SEG2 = 7'b0100100; // 2
            SEG3 = 7'b0110000; // 3
            SEG4 = 7'b0011001; // 4
            SEG5 = 7'b0010010; // 5
            SEG6 = 7'b0000010; // 6
            SEG7 = 7'b1111000; // 7
    
            #20000; // 20 ms
            $finish;
        end

endmodule
