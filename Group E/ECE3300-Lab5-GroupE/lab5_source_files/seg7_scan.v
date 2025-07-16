`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 07/16/2025 11:24:26 AM
// Design Name: 
// Module Name: seg7_scan
// Project Name: seg7_scan
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
    input rst_n,                  
    input [3:0] digit0, digit1,   
    output reg [6:0] seg,         
    output reg [1:0] an           
);
    reg [15:0] refresh_counter;
    wire refresh_tick = refresh_counter[15]; 
    reg sel;  // 0 = digit0, 1 = digit1

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            sel <= 0;
        else if (refresh_tick)
            sel <= ~sel;
    end

    wire [3:0] digit = sel ? digit1 : digit0;

    always @(*) begin
        case (digit)
            4'd0: seg = 7'b1000000;
            4'd1: seg = 7'b1111001;
            4'd2: seg = 7'b0100100;
            4'd3: seg = 7'b0110000;
            4'd4: seg = 7'b0011001;
            4'd5: seg = 7'b0010010;
            4'd6: seg = 7'b0000010;
            4'd7: seg = 7'b1111000;
            4'd8: seg = 7'b0000000;
            4'd9: seg = 7'b0010000;
            default: seg = 7'b1111111;
        endcase
    end

    always @(*) begin
        case (sel)
            1'b0: an = 2'b10;  // Enable digit 0
            1'b1: an = 2'b01;  // Enable digit 1
        endcase
    end
endmodule

