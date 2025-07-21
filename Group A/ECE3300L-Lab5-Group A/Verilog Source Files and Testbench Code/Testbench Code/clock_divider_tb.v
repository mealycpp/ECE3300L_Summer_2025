`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2025 12:46:45 AM
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


module clock_divider_tb(

    );
    
    reg clk, rst_n;
    wire [31:0] clk_out;
    
    clock_divider div(clk, !rst_n, clk_out);
    
    initial begin
        /*rst_n = 0;
        #5 rst_n = 1;
        #5 rst_n = 0;*/
        clk = 0;
        forever #5 clk = ~clk;
    end
    
endmodule
