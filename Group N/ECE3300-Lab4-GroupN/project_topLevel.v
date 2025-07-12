`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2025 07:36:29 PM
// Design Name: 
// Module Name: project_topLevel
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: this will implement the 7 segment driver to drive the rightmost display
// via 4 switches
//////////////////////////////////////////////////////////////////////////////////


module project_topLevel(
    input [9:0] SW,
    input rst_n,
    input clk,
    output [6:0] Cnode,
    output dp,
    output [7:0] AN,
    output [31:0] bits_out
    );
    reg [31:0] bits;
    assign bits_out = bits;
    always@(*) begin
        bits = 32'd0;
        case (SW[9:8])
            2'd0: bits[7:0]=SW[7:0];
            2'd1: bits[15:8]=SW[7:0];
            2'd2: bits[23:16]=SW[7:0];
            2'd3: bits[31:24]=SW[7:0];
        endcase
    end
    seg7_driver inst (.bits(bits), .rst_n(rst_n), .clk(clk), .Cnode(Cnode), .dp(dp), .AN(AN));
endmodule 
