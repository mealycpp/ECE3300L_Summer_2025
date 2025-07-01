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
    //sel 0
        SW = 16'h0001;
        btnD = 0;
        btnU = 0;
        btnL = 0;
        btnR = 0;
        rst = 1;
        #20
        rst = 0;
        
        //sel 1
        SW = 16'h0002;
        btnD = 1;
        #40
        btnD = 0;
        #40
        btnD = 1;
        #40
        btnD = 0;
        rst = 0;
        #40
        
        //sel 2
        SW = 16'h0004;
        btnR = 1;
        #40
        btnR = 0;
        #40
        btnR = 1;
        #40
        btnR = 0;
        #40
        
        //sel 3
        SW = 16'h0008;
        btnR = 1;
        btnD = 1;
        #40
        btnR = 0;
        btnD = 0;
        #40
        btnR = 1;
        btnD = 1;
        #40
        btnR = 0;
        btnD = 0;
        #40
        
        //sel 4
        SW = 16'h0010;
        btnL = 1;
        #40
        btnL = 0;
        #40
        btnL = 1;
        #40
        btnL = 0;
        #40
        
        //sel 5
        SW = 16'h0020;
        btnL = 1;
        btnD = 1;
        #40
        btnL = 0;
        btnD = 0;
        #40
        btnL = 1;
        btnD = 1;
        #40
        btnL = 0;
        btnD = 0;
        #40
        
        //sel 6
        SW = 16'h0040;
        btnL = 1;
        btnR = 1;
        #40
        btnL = 0;
        btnR = 0;
        #40
        btnL = 1;
        btnR = 1;
        #40
        btnL = 0;
        btnR = 0;
        #40
        
        //sel 7
        SW = 16'h0080;
        btnD = 1;
        btnL = 1;
        btnR = 1;
        #40
        btnD = 0;
        btnL = 0;
        btnR = 0;
        #40
        btnD = 1;
        btnL = 1;
        btnR = 1;
        #40
        btnD = 0;
        btnL = 0;
        btnR = 0;
        #40
        
        //sel 8
        SW = 16'h0100;
        btnU = 1;
        #40
        btnU = 0;
        #40
        btnU = 1;
        #40
        btnU = 0;
        #40
        
        //sel 9
        SW = 16'h0200;
        btnU = 1;
        btnD = 1;
        #40
        btnU = 0;
        btnD = 0;
        #40
        btnU = 1;
        btnD = 1;
        #40
        btnU = 0;
        btnD = 0;
        #40
        
        //sel 10
        SW = 16'h0400;
        btnU = 1;
        btnR = 1;
        #40
        btnU = 0;
        btnR = 0;
        #40
        btnU = 1;
        btnR = 1;
        #40
        btnU = 0;
        btnR = 0;
        #40
        
        //sel 11
        SW = 16'h0800;
        btnU = 1;
        btnR = 1;
        btnD = 1;
        #40
        btnU = 0;
        btnR = 0;
        btnD = 0;
        #40
        btnU = 1;
        btnR = 1;
        btnD = 1;
        #40
        btnU = 0;
        btnR = 0;
        btnD = 0;
        #40
        
        //sel 12
        SW = 16'h1000;
        btnU = 1;
        btnL = 1;
        #40
        btnU = 0;
        btnL = 0;
        #40
        btnU = 1;
        btnL = 1;
        #40
        btnU = 0;
        btnL = 0;
        #40
        
        //sel 13
        SW = 16'h2000;
        btnU = 1;
        btnL = 1;
        btnD = 1;
        #40
        btnU = 0;
        btnL = 0;
        btnD = 0;
        #40
        btnU = 1;
        btnL = 1;
        btnD = 1;
        #40
        btnU = 0;
        btnL = 0;
        btnD = 0;
        #40
        
        //sel 14
        SW = 16'h4000;
        btnU = 1;
        btnL = 1;
        btnR = 1;
        #40
        btnU = 0;
        btnL = 0;
        btnR = 0;
        #40
        btnU = 1;
        btnL = 1;
        btnR = 1;
        #40
        btnU = 0;
        btnL = 0;
        btnR = 0;
        #40
        
        //sel 15
        SW = 16'h8000;
        btnU = 1;
        btnL = 1;
        btnR = 1;
        btnD = 1;
        #40
        btnU = 0;
        btnL = 0;
        btnR = 0;
        btnD = 0;
        #40
        btnU = 1;
        btnL = 1;
        btnR = 1;
        btnD = 1;
        #40
        btnU = 0;
        btnL = 0;
        btnR = 0;
        btnD = 0;
        #10 $finish;
    end
    
endmodule
