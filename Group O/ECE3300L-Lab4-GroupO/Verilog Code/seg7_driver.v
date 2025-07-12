`timescale 1ns / 1ps

module seg7_driver(
    input clk,
    input [15:0] SW,
    output [15:0] LED,
    output [6:0] Cnode,
    output dp,
    output [7:0] AN
);

    reg [19:0] tmp = 0;
    reg [3:0] digit;
    reg [6:0] raw_seg;
    wire [2:0] s;

    assign dp = 1'b1;
    assign LED = SW;
    assign s = tmp[17:15];

    always @(posedge clk)
        tmp <= tmp + 1;

    always @(*) begin
        case (s)
            3'd0: digit = SW[3:0];
            3'd1: digit = SW[7:4];
            3'd2: digit = SW[11:8];
            3'd3: digit = SW[15:12];
            default: digit = 4'b0000;
        endcase
    end

    always @(*) begin
        case (digit)
            4'd0: raw_seg = 7'b0000001;
            4'd1: raw_seg = 7'b1001111;
            4'd2: raw_seg = 7'b0010010;
            4'd3: raw_seg = 7'b0000110;
            4'd4: raw_seg = 7'b1001100;
            4'd5: raw_seg = 7'b0100100;
            4'd6: raw_seg = 7'b0100000;
            4'd7: raw_seg = 7'b0001111;
            4'd8: raw_seg = 7'b0000000;
            4'd9: raw_seg = 7'b0001100;
            4'd10: raw_seg = 7'b0001000;
            4'd11: raw_seg = 7'b1100000;
            4'd12: raw_seg = 7'b0110001;
            4'd13: raw_seg = 7'b1000010;
            4'd14: raw_seg = 7'b0110000;
            4'd15: raw_seg = 7'b0111000;
            default: raw_seg = 7'b1111111;
        endcase
    end

    assign Cnode = {
        raw_seg[0],
        raw_seg[1],
        raw_seg[2],
        raw_seg[3],
        raw_seg[4],
        raw_seg[5],
        raw_seg[6]
    };

    reg [7:0] AN_tmp;
    always @(*) begin
        case(s)
            3'd0: AN_tmp = 8'b11111110;
            3'd1: AN_tmp = 8'b11111101;
            3'd2: AN_tmp = 8'b11111011;
            3'd3: AN_tmp = 8'b11110111;
            default: AN_tmp = 8'b11111111;
        endcase
    end

    assign AN = AN_tmp;

endmodule



