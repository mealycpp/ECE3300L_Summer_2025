`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2025 09:29:40 PM
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


module seg7_scan_tb(

    );
    
    reg clk;
    reg [7:0] result;
    reg [3:0] input_nibble;
    wire [7:0] AN;
    wire [6:0] Cnode;
    
    seg7_scan driver(clk, result, input_nibble, AN, Cnode);
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        result = 8'd24;
        input_nibble = 4'b1100;
    end
    
endmodule
