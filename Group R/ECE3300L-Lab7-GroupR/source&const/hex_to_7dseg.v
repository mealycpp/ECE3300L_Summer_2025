`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 08/04/2025 10:58:56 AM
// Design Name: 
// Module Name: hex_to_7seg
// Project Name: hex_to_7seg
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

module hex_to_7dseg(
    input wire [3:0] hex,
    output reg [6:0] SEG
);
    always @(*) begin
        case (hex)
           4'd0: SEG <= 7'b1000000;
            4'd1: SEG <= 7'b1111001;
            4'd2: SEG <= 7'b0100100;
            4'd3: SEG <= 7'b0110000;
            4'd4: SEG <= 7'b0011001;
            4'd5: SEG <= 7'b0010010;
            4'd6: SEG <= 7'b0000010;
            4'd7: SEG <= 7'b1111000;
            4'd8: SEG <= 7'b0000000;
            4'd9: SEG <= 7'b0010000;
            4'd10: SEG <= 7'b0001000;
            4'd11: SEG <= 7'b0000011;
            4'd12: SEG <= 7'b1000110;
            4'd13: SEG <= 7'b0100001;
            4'd14: SEG <= 7'b0000110;
            4'd15: SEG <= 7'b0001110;
            default: SEG <= 7'b1111111; 
        endcase
    end
endmodule