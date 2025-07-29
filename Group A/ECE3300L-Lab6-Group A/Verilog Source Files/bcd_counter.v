`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2025 04:28:57 AM
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
    input clk_div,
    input rst_n,
    input dir_bit,
    output reg [3:0] value
    );
    
    always @(posedge clk_div or negedge rst_n) begin
        if(!rst_n) value <= 4'd0;
        else begin
            if(dir_bit) begin
                if(value == 4'd9) value <= 4'd0;
                else value <= value + 1;
            end
            else begin
                if(value == 4'd0) value <= 4'd9;
                else value <= value - 1;
            end
        end
    end
    
endmodule
