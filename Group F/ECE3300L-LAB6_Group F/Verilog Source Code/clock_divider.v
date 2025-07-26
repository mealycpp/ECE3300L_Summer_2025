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
    input wire clk,
    input wire [4:0] SW,
    output wire clk_div
    );
    reg [31:0] counter;
      
    always @(posedge clk)
        counter <= counter + 1;

    assign clk_div = counter[SW];
 
endmodule
