`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2025 06:22:54 PM
// Design Name: 
// Module Name: seg7_scan
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


module seg7_scan(
 input clk,
    input [3:0] digit0,
    input [3:0] digit1,
    output reg [6:0] seg,// Change to CNODE 
    output reg [7:0] an // CHANGE TO AN 
);
    reg [19:0] refresh_counter = 0;
    reg refresh_clk = 0;
    reg toggle = 0;

    initial begin
        seg = 7'b1111111;
        an  = 8'b11111111;
    end

    always @(posedge clk) begin
        refresh_counter <= refresh_counter + 1;
        refresh_clk <= refresh_counter[19];
    end

    always @(posedge refresh_clk) begin
        toggle <= ~toggle;
        if (toggle) begin
            an <= 8'b11111110; // AN[0]
            seg <= decode_7seg(digit0);
        end else begin
            an <= 8'b11111101; // AN[1]
            seg <= decode_7seg(digit1);
        end
    end

    function [6:0] decode_7seg;
        input [3:0] digit;
        case (digit)
            4'd0: decode_7seg = 7'b1000000;
            4'd1: decode_7seg = 7'b1111001;
            4'd2: decode_7seg = 7'b0100100;
            4'd3: decode_7seg = 7'b0110000;
            4'd4: decode_7seg = 7'b0011001;
            4'd5: decode_7seg = 7'b0010010;
            4'd6: decode_7seg = 7'b0000010;
            4'd7: decode_7seg = 7'b1111000;
            4'd8: decode_7seg = 7'b0000000;
            4'd9: decode_7seg = 7'b0010000;
            default: decode_7seg = 7'b1111111;
        endcase
    endfunction
endmodule