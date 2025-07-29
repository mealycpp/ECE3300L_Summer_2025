`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Dalton Hoang
// 
// Create Date: 07/25/2025 12:51:10 AM
// Design Name: Binary Coded Decimal Counter
// Module Name: bcd_counter
// Project Name: BCD Counter
// Target Devices: Nexys A7 100T
// Tool Versions: 
// Description: Counts from 0 to 9 in either direction based on control input and single-cyycle clock tick
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module bcd_counter(
    input wire clk,
    input wire rst_n,
    input wire dir,            // up = 1 and 0 = down
    output reg [3:0] value  
 );

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            value <= 0;
        else if (dir)
            value <= (value == 9) ? 0 : value + 1;    
        else
            value <= (value == 0) ? 9 : value - 1; 
        end
endmodule