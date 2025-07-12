`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2025 03:06:33 PM
// Design Name: 
// Module Name: top_display
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

module top_display(
    input clk,
    input rst,
    input [15:0] SW,
    output [15:0] LED,
    output [6:0] seg,
    output dp,
    output [7:0] an
);

    assign LED = SW;
    wire [31:0] SW_ext = {16'b0, SW};

    seg7_driver u_seg7 (
        .clk(clk),
        .rst_n(~rst),
        .SW(SW_ext),
        .seg(seg),  
        .dp(dp),
        .an(an)
    );

endmodule




