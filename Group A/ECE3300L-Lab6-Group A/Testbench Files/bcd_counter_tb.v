`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2025 09:29:40 PM
// Design Name: 
// Module Name: bcd_counter_tb
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


module bcd_counter_tb(
    );
    
    reg clk_div, rst_n, dir_bit;
    wire [3:0] value;
    
    bcd_counter count(clk_div, rst_n, dir_bit, value);
    
    initial begin
        clk_div = 0;
        forever #5 clk_div = ~clk_div;
    end
    
    initial begin
        rst_n = 1;
        #1 rst_n = 0;
        #1 rst_n = 1;
        dir_bit = 1;
    end
    
endmodule
