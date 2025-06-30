`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2025 03:27:39 PM
// Design Name: 
// Module Name: tb_16x1mux
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


module tb_16x1mux(

    );
    
    
    reg clk, rst, btnU, btnD, btnL, btnR;
    wire LED0;
    reg [15:0] SW;
    
    
    top_mux_lab3 TB_TESTING(.clk(clk), .rst(rst), .btnU(btnU), .btnD(btnD), .btnL(btnL), .btnR(btnR), .SW(SW), .LED0(LED0));
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clock every 5 time units (10 time units full period)
    end
    initial begin
        rst = 1;
        #20
        rst = 0;
        
        SW = 16'h0008;
        rst = 0;
        btnD = 1;
        btnU = 0;
        btnL = 0;
        btnR = 1;
        #100
        btnD = 0;
        btnR = 0;
        #100
        btnD = 1;
        btnR = 1;
        #100
        btnD = 0;
        btnR = 0;
        #100 $finish;
    end
    
endmodule
