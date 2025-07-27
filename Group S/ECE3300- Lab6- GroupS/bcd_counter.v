`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2025 09:52:47 PM
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
    input clk_div,//divided clock
    input BTN0,// active low reset
    input [1:0] dir_bit, // direction bit
    output reg [3:0] BCD // 4 bit BCD
    );
    always @(posedge clk_div or negedge BTN0) begin
        if (!BTN0) begin
        //resetbcd value
            BCD <= 4'd0; 
        end else begin
            if (dir_bit) begin // count up
                if (BCD == 4'd9) begin // set up case for rollover
                    BCD <= 4'd0;
                end else begin
                    BCD <= BCD + 4'd1;
                end
            end else begin // count down
                if (BCD == 4'd0) begin // setup case for rollover counting down
                    BCD <= 4'd9;
                end else begin
                    BCD <= BCD - 4'd1;
                end
            end
        end
    end
endmodule
