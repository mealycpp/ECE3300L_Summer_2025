`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 07/16/2025 11:00:32 AM
// Design Name: 
// Module Name: clock_divider
// Project Name: clock_divider
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

module clock_divider (
    input clk,              
    input rst_n,            
    output reg [31:0] cnt   
);
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            cnt <= 32'd0;   // Reset counter
        else
            cnt <= cnt + 1; // Increment counter on each clock
endmodule
