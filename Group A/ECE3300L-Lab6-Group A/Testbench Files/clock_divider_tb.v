`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2025 09:29:40 PM
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
    reg [4:0] SW;
    wire clk_out;
    integer i;
    
    clock_divider TB(clk, rst_n, SW, clk_out);
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        rst_n = 1;
        #1 rst_n = 0;
        #1 rst_n = 1;
        SW = 5'b10000;
    end
    
endmodule
