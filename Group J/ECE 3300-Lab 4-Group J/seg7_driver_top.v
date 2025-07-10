`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2025 03:59:34 PM
// Design Name: 
// Module Name: seg7_driver_top
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


module seg7_driver_top(
                        input clk,
                        input rst_n,
                        input [9:0] SW,
                        output [6:0] Cnode,
                        output dp,
                        output [7:0] AN
                        );
                        
    wire [31:0] SWinput;
    
    decoder10to32 dec(.selectPart(SW[9:8]), .partValue(SW[7:0]), .out(SWinput));
    seg7_driver driver(.clk(clk), .rst_n(rst_n), .SW(SW), .Cnode(Cnode), .dp(dp), .AN(AN));

endmodule
