`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 07/24/2025 11:31:41 AM
// Design Name: 
// Module Name: seg7_scan
// Project Name: seg7_scan
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
    input clk,
    input rst_n,
    input [3:0] digit0, digit1, digit2,
    output reg [6:0] seg,
    output reg [2:0] an
);
    reg [19:0] refresh_counter;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end
    
    wire [1:0] sel = refresh_counter [19:18];
    reg [3:0] current_digit;
    always @(*) begin
            case (sel)
                2'b00: begin 
                    an = 8'b11111110; 
                    current_digit = digit0;
                end
                2'b01: begin 
                    an = 8'b11111101; 
                    current_digit = digit1;
                end
                2'b10: begin 
                    an = 8'b11111011; 
                    current_digit = digit2;
                end
                default: begin 
                    AN = 8'b11111111; 
                    current_digit = 4'd0;
                end
            endcase

        case (current_digit)
            4'h0: seg = 7'b1000000; // 0
            4'h1: seg = 7'b1111001; // 1
            4'h2: seg = 7'b0100100; // 2
            4'h3: seg = 7'b0110000; // 3
            4'h4: seg = 7'b0011001; // 4
            4'h5: seg = 7'b0010010; // 5
            4'h6: seg = 7'b0000010; // 6
            4'h7: seg = 7'b1111000; // 7
            4'h8: seg = 7'b0000000; // 8
            4'h9: seg = 7'b0010000; // 9
            4'hA: seg = 7'b0001000; // A
            4'hB: seg = 7'b0000011; // B
            4'hC: seg = 7'b1000110; // C
            4'hD: seg = 7'b0100001; // D
            4'hE: seg = 7'b0000110; // E
            4'hF: seg = 7'b0001110; // F
            default: seg = 7'b1111111; // Blank
        endcase
    end
endmodule
