`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/27/2025 04:49:50 PM
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
    input wire rst_n,
    input wire [3:0] onesPlace,
    input wire [3:0] tensPlace,
    input wire [3:0] digitCtrl,
    output reg [6:0] SEG,
    output reg [7:0] AN
);
    
    reg [19:0] refresh_counter = 0;
    wire [1:0] sel;
    reg [3:0] digit_val;
    
    assign sel = refresh_counter[19:18];

    always @(posedge clk or negedge rst_n) 
        begin
            if (!rst_n)
                refresh_counter <= 0;
            else
                refresh_counter <= refresh_counter + 1;
        end

    always @(*) 
        begin
            case(sel)
                2'd0: 
                    begin
                        AN = 8'b11111110;
                        digit_val = onesPlace;
                    end
                2'd1: 
                    begin
                        AN = 8'b11111101;
                        digit_val = tensPlace;
                    end
                2'd2:
                    begin
                        AN = 8'b11111011;
                        digit_val = digitCtrl;
                    end 
                default: AN = 8'b11111111;
            endcase
        end

    always@(*)
        begin
            case(digit_val)
                4'd0:  SEG = 7'b1000000; // 0
                4'd1:  SEG = 7'b1111001; // 1
                4'd2:  SEG = 7'b0100100; // 2
                4'd3:  SEG = 7'b0110000; // 3
                4'd4:  SEG = 7'b0011001; // 4
                4'd5:  SEG = 7'b0010010; // 5
                4'd6:  SEG = 7'b0000010; // 6
                4'd7:  SEG = 7'b1111000; // 7
                4'd8:  SEG = 7'b0000000; // 8
                4'd9:  SEG = 7'b0010000; // 9
                4'd10: SEG = 7'b0001000; // A
                4'd11: SEG = 7'b0000011; // b
                4'd12: SEG = 7'b1000110; // C
                4'd13: SEG = 7'b0100001; // d
                4'd14: SEG = 7'b0000110; // E
                4'd15: SEG = 7'b0001110; // F
    default: SEG = 7'b1111111; // Blank
endcase
        end

endmodule
