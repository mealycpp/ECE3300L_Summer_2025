`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 01:12:51 PM
// Design Name: 
// Module Name: bcd_counter
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


module bcd_counter(
    input wire clk,
    input wire rst_n,
    input wire dir_bit,                  // SW7 or SW8
    output reg [3:0] bcd_out       // BCD output (0–9)
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            bcd_out <= 4'd0;
        else if (dir_bit)
            bcd_out <= (bcd_out == 9) ? 0 : bcd_out + 1;
        else
            bcd_out <= (bcd_out == 0) ? 9 : bcd_out - 1; 
        end

endmodule
