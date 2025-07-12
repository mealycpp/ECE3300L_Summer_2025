`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2025 03:05:49 PM
// Design Name: 
// Module Name: seg7_driver
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

module seg7_driver(
    input clk,
    input rst_n,
    input [31:0] SW,
    output [6:0] seg,
    output dp,
    output [7:0] an
);

    reg [19:0] tmp;
    reg [3:0] digit;
    reg [6:0] seg_reg;
    reg [7:0] an_reg;

    assign dp = 1'b1;           
    assign seg = seg_reg;       
    assign an = an_reg;         

    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            tmp <= 0;
        else
            tmp <= tmp + 1;
    end

    wire [2:0] s = tmp[19:17]; 

    
    always @(*) begin
        case (s)
            3'd0: digit = SW[3:0];        
            3'd1: digit = SW[7:4];
            3'd2: digit = SW[11:8];
            3'd3: digit = SW[15:12];
            3'd4: digit = SW[3:0];        // Duplicate of digit 0
            3'd5: digit = SW[7:4];        // Duplicate of digit 1
            3'd6: digit = SW[11:8];       // Duplicate of digit 2
            3'd7: digit = SW[15:12];      // Duplicate of digit 3
            default: digit = 4'b0000;
        endcase
    end

    
    always @(*) begin
        case (digit)
            4'd0: seg_reg = 7'b1000000; 
            4'd1: seg_reg = 7'b1111001;
            4'd2: seg_reg = 7'b0100100;
            4'd3: seg_reg = 7'b0110000;
            4'd4: seg_reg = 7'b0011001;
            4'd5: seg_reg = 7'b0010010;
            4'd6: seg_reg = 7'b0000010;
            4'd7: seg_reg = 7'b1111000;
            4'd8: seg_reg = 7'b0000000;
            4'd9: seg_reg = 7'b0010000;
            4'd10: seg_reg = 7'b0001000;  // A
            4'd11: seg_reg = 7'b0000011;  // B
            4'd12: seg_reg = 7'b1000110;  // C
            4'd13: seg_reg = 7'b0100001;  // D
            4'd14: seg_reg = 7'b0000110;  // E
            4'd15: seg_reg = 7'b0001110;  // F
            default: seg_reg = 7'b1111111;
        endcase
    end

    
    always @(*) begin
        case (s)
            3'd0: an_reg = 8'b11111110;
            3'd1: an_reg = 8'b11111101;
            3'd2: an_reg = 8'b11111011;
            3'd3: an_reg = 8'b11110111;
            3'd4: an_reg = 8'b11101111;
            3'd5: an_reg = 8'b11011111;
            3'd6: an_reg = 8'b10111111;
            3'd7: an_reg = 8'b01111111;
            default: an_reg = 8'b11111111;
        endcase
    end

endmodule







