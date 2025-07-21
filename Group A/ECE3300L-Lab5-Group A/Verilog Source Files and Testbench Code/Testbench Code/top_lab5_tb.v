`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2025 10:21:13 PM
// Design Name: 
// Module Name: tb
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


module tb(

    );
    
    reg clk, rst_n, dir;
    reg [4:0] SW;
    wire [6:0] SEG;
    wire [7:0] AN;
    wire [12:0] LED;
    
    top_lab5 implementation(clk, rst_n, dir, SW, SEG, AN, LED);
    
    initial begin
        SW = 5'd20;
        clk = 0;
        rst_n = 0;
        #5 rst_n = 1;
        #5 rst_n = 0;
        dir = 1;
        forever #5 clk = ~clk;
    end
    
    
   
endmodule
