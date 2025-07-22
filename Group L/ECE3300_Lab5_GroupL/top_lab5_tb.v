`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/20/2025 03:30:05 PM
// Design Name: 
// Module Name: top_lab5_tb
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


module top_lab5_tb();
    
    reg clk_tb, rst_tb;
    reg [4:0] SW_tb;
    reg up_counter_tb; 
    wire [1:0] AN_tb;
    wire [6:0] SEG_tb;
    wire [12:0] LED_tb;
    
    
    top_lab5 DUT(
        .clk(clk_tb),
        .sw(SW_tb),
        .btn0(rst_tb),
        .btn1(up_counter_tb),
        .seg(SEG_tb),
        .an(AN_tb),
        .led(LED_tb)
    );
    
    always 
        begin: clock_gen
            #5 clk_tb = ~clk_tb;
        end
        
    initial
        begin
            clk_tb = 0;
            SW_tb = 5'b01010;
            rst_tb = 1;
            up_counter_tb = 0;
            
            // Run with Reset high for some time
            #1000;
            
            rst_tb = 0; 
            #20
            up_counter_tb = 1;
            
            #10000;
            $stop;
            
        end
    
    



endmodule
