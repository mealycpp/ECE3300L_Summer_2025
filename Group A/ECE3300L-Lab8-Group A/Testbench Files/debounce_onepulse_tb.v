`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2025 07:01:21 PM
// Design Name: 
// Module Name: debounce_onepulse_tb
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


module debounce_onepulse_tb(

    );
    
    reg clk, rst_n, din;
    wire pulse;
    
    debounce_onepulse #(.STABLE_TICKS(20)) btnR(clk, rst_n, din, pulse);
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        rst_n = 1;
        #5 rst_n = 0;
        #5 rst_n = 1;
        #5 din = 1;
    end
    
endmodule
