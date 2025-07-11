`timescale 1ns / 1ps
module seg7_driver(
    input clk,
    input rst_n,
    input [15:0] SW,
    output [15:0] LED,
    output reg [6:0] Cnode,
    output dp,
    output [7:0] AN
    );

    reg [19:0] tmp;
    wire [2:0] s;
    reg [3:0] digits [7:0];
    reg [7:0] AN_tmp;

    assign dp = 1'b1;
    assign LED = SW;
    assign s = tmp[19:17];
    assign AN = AN_tmp;

    // Lookup tables for decimal conversion
    reg [3:0] tens_lut [15:0];
    reg [3:0] units_lut [15:0];

    always @(posedge clk or posedge rst_n) begin
    if (rst_n) begin
        tens_lut[ 0] = 16; units_lut[ 0] = 0;
        tens_lut[ 1] = 16; units_lut[ 1] = 1;
        tens_lut[ 2] = 16; units_lut[ 2] = 2;
        tens_lut[ 3] = 16; units_lut[ 3] = 3;
        tens_lut[ 4] = 16; units_lut[ 4] = 4;
        tens_lut[ 5] = 16; units_lut[ 5] = 5;
        tens_lut[ 6] = 16; units_lut[ 6] = 6;
        tens_lut[ 7] = 16; units_lut[ 7] = 7;
        tens_lut[ 8] = 16; units_lut[ 8] = 8;
        tens_lut[ 9] = 16; units_lut[ 9] = 9;
        tens_lut[10] = 1; units_lut[10] = 0;
        tens_lut[11] = 1; units_lut[11] = 1;
        tens_lut[12] = 1; units_lut[12] = 2;
        tens_lut[13] = 1; units_lut[13] = 3;
        tens_lut[14] = 1; units_lut[14] = 4;
        tens_lut[15] = 1; units_lut[15] = 5;
    end
    end

    // Update counter
    always @(posedge clk or posedge rst_n)
        if (rst_n)
            tmp <= 0;
        else
            tmp <= tmp + 1;
    
    // Update digit values from SW input
    always @(posedge clk) begin
        digits[0] <= units_lut[SW[3:0]];
        digits[1] <= tens_lut[SW[3:0]];
        digits[2] <= units_lut[SW[7:4]];
        digits[3] <= tens_lut[SW[7:4]];
        digits[4] <= SW[3:0];
        digits[5] <= SW[7:4];
        digits[6] <= SW[11:8];
        digits[7] <= SW[15:12];
    end

    // Select active digit
    always @(posedge clk) begin
        case (s)
            3'd0: AN_tmp <= 8'b11111110;
            3'd1: AN_tmp <= 8'b11111101;
            3'd2: AN_tmp <= 8'b11111011;
            3'd3: AN_tmp <= 8'b11110111;
            3'd4: AN_tmp <= 8'b11101111;
            3'd5: AN_tmp <= 8'b11011111;
            3'd6: AN_tmp <= 8'b10111111;
            3'd7: AN_tmp <= 8'b01111111;
            default: AN_tmp <= 8'b11111111;
        endcase
    end

    // 7-segment encoding
    always @(posedge clk) begin
        case (digits[s])
            4'd0:  Cnode <= 7'b1000000;
            4'd1:  Cnode <= 7'b1111001;
            4'd2:  Cnode <= 7'b0100100;
            4'd3:  Cnode <= 7'b0110000;
            4'd4:  Cnode <= 7'b0011001;
            4'd5:  Cnode <= 7'b0010010;
            4'd6:  Cnode <= 7'b0000010;
            4'd7:  Cnode <= 7'b1111000;
            4'd8:  Cnode <= 7'b0000000;
            4'd9:  Cnode <= 7'b0011000;
            4'd10: Cnode <= 7'b0001000; // A
            4'd11: Cnode <= 7'b0000011; // b
            4'd12: Cnode <= 7'b1000110; // C
            4'd13: Cnode <= 7'b0100001; // d
            4'd14: Cnode <= 7'b0000110; // E
            4'd15: Cnode <= 7'b0001110; // F
            default: Cnode <= 7'b1111111;
        endcase
    end

endmodule
