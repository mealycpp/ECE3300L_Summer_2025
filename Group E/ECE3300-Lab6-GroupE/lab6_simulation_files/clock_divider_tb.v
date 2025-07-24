`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 07/16/2025 11:58:25 AM
// Design Name: 
// Module Name: clock_divider_tb
// Project Name: clock_divider_tb
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

module clock_divider_tb();
    reg clk = 0;
    reg rst_n;
    wire [31:0] cnt;

    clock_divider uut (
        .clk(clk),
        .rst_n(rst_n),
        .cnt(cnt)
    );

    always #5 clk = ~clk;  // 10 ns period

    initial begin
        rst_n = 0;
        #20;
        rst_n = 1;
        #500;
        $finish;
    end
endmodule

