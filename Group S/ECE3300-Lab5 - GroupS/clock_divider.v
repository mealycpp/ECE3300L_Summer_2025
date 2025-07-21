`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2025 06:06:37 PM
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
    output reg [31:0] cnt // counter
    );
always @(posedge clk or negedge rst_n) begin
if (!rst_n)
cnt <= 0; //reset count
else
cnt <= cnt + 1; // else increment count
end
endmodule
