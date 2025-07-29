`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/27/2025 04:49:50 PM
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
    input wire rst_n,
    output reg [31:0] cnt
);

    always @(posedge clk or negedge rst_n) 
        begin
            if (!rst_n)
                cnt <= 0;
            else
                cnt <= cnt + 1;
        end
    
endmodule
