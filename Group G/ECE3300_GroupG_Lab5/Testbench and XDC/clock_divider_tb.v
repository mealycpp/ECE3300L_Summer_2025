`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2025 06:39:11 PM
// Design Name: 
// Module Name: clock_divider_tb
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


module clock_divider_tb();
    reg CLK = 0;
    wire [31:0] cnt;

    clock_divider uut (
        .CLK(CLK),
        .cnt(cnt)
    );

    // Clock generation
    always #5 CLK = ~CLK;

    initial begin
        $display("Testing clock_divider:");
        #100;
        $stop;
    end
endmodule

