`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2025 02:34:13 AM
// Design Name: 
// Module Name: bcd_up_down_counter_tb
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


module bcd_up_down_counter_tb(

    );
    
    reg clk, rst_n, dir;
    wire [3:0] digit0, digit1;
    
bcd_up_down_counter counter(
    clk, rst_n, dir, digit0, digit1
);

    initial begin
        dir = 1;
        rst_n = 1;
        #5 rst_n = 0;
        #5 rst_n = 1;
        clk = 0;
        forever #5 clk = ~clk;
    end
    
endmodule
