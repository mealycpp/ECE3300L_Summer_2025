`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 01:53:35 PM
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
    input wire clk_div,
    input wire BTN0,
    input wire dir_bit,
    output reg [3:0] bcd_out
    );

    always @(posedge clk_div or negedge BTN0)
        if (~BTN0)
            bcd_out <= 4'd0;
        else if (dir_bit)
            bcd_out <= (bcd_out == 4'd9) ? 4'd0 : bcd_out + 1;
        else
            bcd_out <= (bcd_out == 4'd0) ? 4'd9 : bcd_out - 1;
endmodule
