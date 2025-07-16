`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2025 11:04:16 AM
// Design Name: 
// Module Name: mux32x1
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


module mux32x1(
    input [31:0] cnt, 
    input [4:0] sel, 
    output clk_out
    );
    assign clk_out = cnt[sel];
endmodule
