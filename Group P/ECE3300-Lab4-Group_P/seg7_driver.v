`timescale 1ns / 1ps

module seg7_driver(
    input clk,                 // system clock
    input rst_n,               // active-low reset
    input [15:0] SW,           // 16-bit switch input
    output reg [6:0] Cnode,    // segment outputs A-G
    output dp,                 // decimal point (unused)
    output [7:0] AN,           // active-low digit enables
    output [15:0] LED          // led output
);

    reg [19:0] refresh_counter;  // controls refresh rate
    reg [3:0] current_nibble;    // current digit to display

    assign dp = 1'b1;  // keep decimal point off

    // HEX to 7-segment conversion
    always @(current_nibble)
        case (current_nibble)
            4'd0:  Cnode = 7'b1000000;
            4'd1:  Cnode = 7'b1001111;
            4'd2:  Cnode = 7'b0100100;
            4'd3:  Cnode = 7'b0110000;
            4'd4:  Cnode = 7'b0011001;
            4'd5:  Cnode = 7'b0010010;
            4'd6:  Cnode = 7'b0000010;
            4'd7:  Cnode = 7'b1111000;
            4'd8:  Cnode = 7'b0000000;
            4'd9:  Cnode = 7'b0010000;
            4'd10: Cnode = 7'b0001000; // A
            4'd11: Cnode = 7'b0000011; // b
            4'd12: Cnode = 7'b1000110; // C
            4'd13: Cnode = 7'b0100001; // d
            4'd14: Cnode = 7'b0000110; // E
            4'd15: Cnode = 7'b0001110; // F
            default: Cnode = 7'b1111111;
        endcase


    // counter increment
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;

    // extract nibble to display
    wire [2:0] digit_index = refresh_counter[19:17];
    always @(digit_index or SW)
        case (digit_index)
            3'd0: current_nibble = SW[3:0];
            3'd1: current_nibble = SW[7:4];
            3'd2: current_nibble = SW[11:8];
            3'd3: current_nibble = SW[15:12];
            3'd4: current_nibble = SW[3:0];
            3'd5: current_nibble = SW[7:4];
            3'd6: current_nibble = SW[11:8];
            3'd7: current_nibble = SW[15:12];
            default: current_nibble = 4'b0000;
        endcase

    // control which digit is active
    reg [7:0] active_digit;
    always @(digit_index)
        case (digit_index)
            3'd0: active_digit = 8'b11111110;
            3'd1: active_digit = 8'b11111101;
            3'd2: active_digit = 8'b11111011;
            3'd3: active_digit = 8'b11110111;
            3'd4: active_digit = 8'b11101111;
            3'd5: active_digit = 8'b11011111;
            3'd6: active_digit = 8'b10111111;
            3'd7: active_digit = 8'b01111111;
            default: active_digit = 8'b11111111;
        endcase

    assign AN = active_digit;
    assign LED = SW;

endmodule
