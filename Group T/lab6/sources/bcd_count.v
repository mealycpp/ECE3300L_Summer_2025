`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/29/2025 12:54:07 AM
// Design Name: 
// Module Name: bcd_count
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


module bcd_count(
    input clk_div,
    input rst_n,
    input dir,
    output reg [3:0] bcd
    );

always @(posedge clk_div or negedge rst_n) begin
    if(!rst_n) begin
        bcd = 0;
    end
    else begin
        if(dir) begin
            bcd <= bcd + 1;
        end
        else begin
            bcd <= bcd - 1;
        end
    end
end
endmodule
