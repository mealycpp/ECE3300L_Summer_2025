`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2025 04:44:20 PM
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
    input wire dir,
    output reg [3:0] BCD
    );
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            BCD <= 4'd0;
        end else begin
            if (dir) begin
                if (BCD == 4'd9)
                    BCD <= 4'd0;
                else
                    BCD <= BCD + 4'd1;
            end else begin
                if (BCD == 4'd0)
                    BCD <= 4'd9;
                else
                    BCD <= BCD - 4'd1;
            end
        end
    end
endmodule