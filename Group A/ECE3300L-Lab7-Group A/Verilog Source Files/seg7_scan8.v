`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 10:56:57 PM
// Design Name: 
// Module Name: seg7_scan8
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


module seg7_scan8(
    input clk,
    input [15:0] data,
    output reg [7:0] AN,
    output [6:0] Cnode
    );
    
    reg [1:0] refresh_tick = 2'd0;
    reg [3:0] digit = 4'd0;
    
    hex_to_7seg convert(digit, Cnode);
    
    always @(posedge clk) begin
        refresh_tick <= refresh_tick + 1;
        
        case (refresh_tick)
            2'b00: begin
                AN <= 8'b11111110;
                digit <= data[3:0];
            end
            2'b01: begin
                AN <= 8'b11111101;
                digit <= data[7:4];
            end
            2'b10: begin
                AN <= 8'b11111011;
                digit <= data[11:8];
            end
            2'b11: begin
                AN <= 8'b11110111;
                digit <= data[15:12];
            end
            default: begin
                AN <= 8'b11111111;
                digit <= 4'd0;
            end
        endcase
    end
    
endmodule
