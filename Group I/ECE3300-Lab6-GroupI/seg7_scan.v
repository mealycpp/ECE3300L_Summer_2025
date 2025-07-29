`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 01:13:39 PM
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
    input wire clk,                          // main system clock
    input wire rst_n,                      // active-low reset
    input wire [3:0] digit0, digit1, digit2 ,            // 1 nibble from switches
    output reg [6:0] SEG,
    output reg [7:0] AN                 // Active-low anode signals
);
    reg [15:0] refresh_counter = 0;
    reg [1:0] sel = 0;
    reg [3:0] current_digit;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end
    
    always @(posedge refresh_counter[15] or negedge rst_n) begin
        if (!rst_n)
            sel <= 0;
        else
            sel <= sel + 1;
    end

    always @(*) begin
        case (sel)
            2'b00: begin
                AN <= 8'b11111110; // Activate digit0
                SEG <= seg_decoder(digit0);
            end
            2'b01: begin
                AN <= 8'b11111101; // Activate digit1
                SEG <= seg_decoder(digit1); 
            end
            2'b10: begin
                AN <= 8'b11111011; // Activate digit1
                SEG <= seg_decoder(digit1);  
            end
        endcase
    end
    
    function [6:0] seg_decoder;
        input [3:0] num;
        case (num)
            4'd0: seg_decoder = 7'b1000000;
            4'd1: seg_decoder = 7'b1111001;
            4'd2: seg_decoder = 7'b0100100;
            4'd3: seg_decoder = 7'b0110000;
            4'd4: seg_decoder = 7'b0011001;
            4'd5: seg_decoder = 7'b0010010;
            4'd6: seg_decoder = 7'b0000010;
            4'd7: seg_decoder = 7'b1111000;
            4'd8: seg_decoder = 7'b0000000;
            4'd9: seg_decoder = 7'b0010000;
            default: seg_decoder = 7'b1111111; // off
        endcase
    endfunction

endmodule
