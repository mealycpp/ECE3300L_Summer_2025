`timescale 1ns / 1ps
module seg7_scan(
    input clk,
    input rst_n,
    input [3:0] dig0,
    input [3:0] dig1,
    input [3:0] dig2,
    output reg [7:0] an,
    output reg [6:0] seg
);
//instantiate wires/registers for secondary clock divider
    reg[16:0] secondary_divider;
    wire divbit = secondary_divider[15];
    reg [1:0] sel;
    reg [3:0] digit;
//clock divider circuit
    always @(posedge clk or negedge rst_n)
        if(!rst_n) secondary_divider <= 0;
        else secondary_divider <= secondary_divider + 1;
//select which anode to drive
    always @(posedge clk or negedge rst_n)
        if (!rst_n) sel <= 0;
        else if(divbit)
        sel <= sel + 1;
//case statement to drive anode
    always @(*) begin
        case (sel)
            2'b00: begin an = 8'b11111110; digit = dig0; end
            2'b01: begin an = 8'b11111101; digit = dig1; end
            2'b10: begin an = 8'b11111011; digit = dig2; end
            default: an = 8'b11111111; //digit = 4'd0; end
        endcase
    end
//drive this set of bits on the 7seg
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
            4'd10: seg = 7'b0001000; 
            4'd11: seg = 7'b0000011; 
            4'd12: seg = 7'b1000110; 
            4'd13: seg = 7'b0100001; 
            4'd14: seg = 7'b0000110; 
            4'd15: seg = 7'b0001110;
            default: seg = 7'b1111111;
        endcase
    end
endmodule