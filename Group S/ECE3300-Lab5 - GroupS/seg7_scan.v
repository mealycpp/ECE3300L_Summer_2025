`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2025 06:06:37 PM
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
    input clk,                      // 100 MHz board clock
    input rst_n,                    // Active-low reset
    input [3:0] digit0,             
    input [3:0] digit1,
    output reg [6:0] seg,           // Segment lines a-g
    output reg [3:0] an             // Anode lines (active low)
        );
    reg [15:0] refresh_counter = 0;
    wire sel;  // Which digit to display
    always @(posedge clk or negedge rst_n) begin 
    if (!rst_n)
    refresh_counter <= 16'd0;
    else
    refresh_counter <= refresh_counter + 1;
    end
    
    assign sel = refresh_counter[15];
    
   reg [3:0] current_digit;
   always @(*) begin
   case (sel)
   2'd0: current_digit = digit0;
   2'd1: current_digit = digit1;
   endcase
   end
       always @(*) begin
        case (sel)
            2'd0: an = 4'b10;  // enable digit0
            2'd1: an = 4'b01;  // enable digit1
            default: an = 4'b11;
        endcase
    end

    // Decode the digit to 7-segment display pattern
    always @(*) begin
        case (current_digit)
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
            default: seg = 7'b1111111; // blank
        endcase
    end
endmodule
