`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2025 09:22:58 PM
// Design Name: 
// Module Name: seg7_tb
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




module seg7_tb();

    reg clk = 0;
    reg rst_n = 0;
    reg [15:0] SW;
    wire [6:0] Cnode;
    wire dp;
    wire [7:0] AN;
    wire [15:0] led;   
    seg7_driver TB_testing (
        .clk(clk),
        .SW(SW),
        .rst_n(rst_n),
        .Cnode(Cnode),
        .dp(dp),
        .AN(AN),
        .led(led)
    );
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        rst_n = 1;
        SW = 16'h0000;
        #10 rst_n = 1;
        SW = 16'h00AF;
        #20;        
        SW = 16'h3100;
        #30;                   
        SW = 16'h42F8;
        #40;           
        SW = 16'h314F;
        #50;           
        SW = 16'hAAAA;     
        #60;        
        SW = 16'hFFFF;     
        #70;        
        $stop;
    end

endmodule