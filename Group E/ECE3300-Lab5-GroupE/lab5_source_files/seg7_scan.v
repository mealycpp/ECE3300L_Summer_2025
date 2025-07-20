`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE3300
// 
// Module Name: seg7_scan
// Description: 4-digit 7-segment scan driver with multiplexing support
//////////////////////////////////////////////////////////////////////////////////

module seg7_scan(
    input clk,                      // 100 MHz board clock
    input rst_n,                    // Active-low reset
    input [3:0] digit0,             // Rightmost digit (LSB)
    input [3:0] digit1,
    input [3:0] digit2,
    input [3:0] digit3,             // Leftmost digit (MSB)
    output reg [6:0] seg,           // Segment lines a-g
    output reg [3:0] an             // Anode lines (active low)
);

    reg [15:0] refresh_counter = 0;
    wire [1:0] sel;  // Which digit to display now

    assign sel = refresh_counter[15:14];

    // Refresh the digit selection at a rate that avoids flickering
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end

    reg [3:0] current_digit;

    // Select the digit value based on sel
    always @(*) begin
        case (sel)
            2'd0: current_digit = digit0;
            2'd1: current_digit = digit1;
            2'd2: current_digit = digit2;
            2'd3: current_digit = digit3;
            default: current_digit = 4'd0;
        endcase
    end

    // Select which anode (digit) to enable (active low)
    always @(*) begin
        case (sel)
            2'd0: an = 4'b1110;  // enable digit0 (rightmost)
            2'd1: an = 4'b1101;  // enable digit1
            2'd2: an = 4'b1011;  // enable digit2
            2'd3: an = 4'b0111;  // enable digit3 (leftmost)
            default: an = 4'b1111;
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