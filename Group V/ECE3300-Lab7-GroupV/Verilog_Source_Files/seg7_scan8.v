`timescale 1ns / 1ps

module seg7_scan8(
    input clk,
    input rst_n,
    input clk_1kHz,
    input [3:0] dig0,
    input [3:0] dig1,
    input [3:0] dig2,
    input [3:0] dig3,
    output reg [7:0] an,
    output [6:0] seg
);
    reg [1:0] sel;
    reg [3:0] digit;

//iterate through AN
    always @(posedge clk_1kHz or negedge rst_n) begin
        if (!rst_n)
            sel <= 0;
        else
            sel <= sel + 1;
    end

//when hits one of these 4 cases it will set digit equal to the digX input, and will iterate through all 4 repeatedly
    always @(*) begin
        case(sel)
            2'b00: begin an = 8'b11111110; digit = dig0; end
            2'b01: begin an = 8'b11111101; digit = dig1; end
            2'b10: begin an = 8'b11111011; digit = dig2; end
            2'b11: begin an = 8'b11110111; digit = dig3; end
            default: begin an = 8'b11111111; digit = 4'd0; end
        endcase
    end

    hex_to_7seg u_hex(.hex(digit), .seg(seg));

endmodule