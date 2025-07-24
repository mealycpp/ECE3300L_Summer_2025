`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 07/24/2025 11:48:17 AM
// Design Name: 
// Module Name: bcd_counter_tb
// Project Name: bcd_counter_tb
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

module bcd_counter_tb (
    input clk,
    input rst_n,
    input dir,            // 1 = up, 0 = down
    output reg [3:0] bcd
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            bcd <= 0;
        else begin
            if (dir) begin
                bcd <= (bcd == 9) ? 0 : bcd + 1;
            end else begin
                bcd <= (bcd == 0) ? 9 : bcd - 1;
            end
        end
    end
endmodule
