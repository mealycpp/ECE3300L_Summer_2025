`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2025 09:29:40 PM
// Design Name: 
// Module Name: top_lab6_tb
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


module top_lab6_tb(
    
    );
    
    reg clk, rst_n;
    reg [8:0] SW;
    wire [7:0] AN;
    wire [6:0] Cnode;
    wire [7:0] LED;
    
    top_lab6 tb(clk, rst_n, SW, AN, Cnode, LED);
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        rst_n = 0;
        #5 rst_n = 1;
        #5 rst_n = 0;
        
        SW = 9'b000100000;
    end
    
endmodule
