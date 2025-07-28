`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 12:04:50 AM
// Design Name: 
// Module Name: seg7_scan_tb
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


module seg7_scan_tb;

    reg clk = 0;
    reg BTN0 = 0;
    reg [3:0] digit0 = 4'd3;
    reg [3:0] digit1 = 4'd11;
    reg [3:0] digit2 = 4'd7;
    
    //defined digits as 3,B,7
    
    wire [6:0] SEG;
    wire [3:0] AN;
    
seg7_scan dut(
    .clk (clk),
    .BTN0 (BTN0),
    .digit0 (digit0),
    .digit1 (digit1),
    .digit2 (digit2),
    .SEG (SEG),
    .AN (AN)  
    );
    
    
    always #5 clk = ~clk;
    
    initial begin
        #1_000_000; // run for 1ms
        end
endmodule
