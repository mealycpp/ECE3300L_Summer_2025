`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2025 04:11:18 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(
    input clk,
    input rst_n,
    input [4:0] select,
    output clk_div
);

    reg [31:0] count
    
    always@(posedge clk or negedge rst_n) begin
        if (!rst_n)
            count <= 32'b0;
        else
            count <= count + 1;
        end
        
        assign clk_div = count[select];
        
endmodule
