`timescale 1ns / 1ps

module seg7_scan(
    input clk,
    input rst_n,
    input [3:0] digit0, digit1, digit2,
    output reg [6:0] seg,
    output reg [2:0] an
);
    reg [15:0] refresh_counter;
    wire refresh_tick = refresh_counter[15];
    reg [1:0] sel;

    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;

    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            sel <= 0;
        else if (refresh_tick)
            sel <= sel + 1;

    reg [3:0] current_digit;
    always @(*) begin
        case (sel)
            2'd0: begin current_digit = digit0; an = 3'b110; end // AN0
            2'd1: begin current_digit = digit1; an = 3'b101; end // AN1
            2'd2: begin current_digit = digit2; an = 3'b011; end // AN2
            default: begin current_digit = 0; an = 3'b111; end
        endcase

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
            default: seg = 7'b1111111;
        endcase
    end
endmodule
