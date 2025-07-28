`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 01:53:20 PM
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
    input wire clk,
    input wire BTN0,
    input wire [7:0] result,
    input wire [3:0] ctrl_nibble,
    output reg [2:0] AN,
    output reg [6:0] SEG
    );

    reg [15:0] clk_divider_count = 0;
    reg [1:0] digit_select = 0;
    reg [3:0] digit_value;

    always @(posedge clk or negedge BTN0) begin
        if (~BTN0)
            clk_divider_count <= 0;
        else
            clk_divider_count <= clk_divider_count + 1;
    end

    always @(posedge clk_divider_count[15] or negedge BTN0) begin
        if (~BTN0)
            digit_select <= 0;
        else
            digit_select <= digit_select + 1;
    end

    always @(*) begin
        case (digit_select)
            2'd0: begin AN = 3'b110; digit_value = result[3:0]; end
            2'd1: begin AN = 3'b101; digit_value = result[7:4]; end
            2'd2: begin AN = 3'b011; digit_value = ctrl_nibble; end
            default: begin AN = 3'b111; digit_value = 4'hF; end
        endcase

        case (digit_value)
            4'h0: SEG = 7'b1000000;
            4'h1: SEG = 7'b1111001;
            4'h2: SEG = 7'b0100100;
            4'h3: SEG = 7'b0110000;
            4'h4: SEG = 7'b0011001;
            4'h5: SEG = 7'b0010010;
            4'h6: SEG = 7'b0000010;
            4'h7: SEG = 7'b1111000;
            4'h8: SEG = 7'b0000000;
            4'h9: SEG = 7'b0010000;
            4'hA: SEG = 7'b0001000;
            4'hB: SEG = 7'b0000011;
            4'hC: SEG = 7'b1000110;
            4'hD: SEG = 7'b0100001;
            4'hE: SEG = 7'b0000110;
            4'hF: SEG = 7'b0001110;
            default: SEG = 7'b1111111;
        endcase
    end
endmodule