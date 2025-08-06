`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2025 06:48:27 PM
// Design Name: 
// Module Name: hex_to_7seg
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


module hex_to_7seg(
    input  [3:0] hex,
    output reg [6:0] SEG
);
    // based on digit, maps the Cnode segments to output 0 - F
    always @(hex) begin
        case (hex)
            4'h0: SEG = 7'b0000001; // 0
            4'h1: SEG = 7'b1001111; // 1
            4'h2: SEG = 7'b0010010; // 2
            4'h3: SEG = 7'b0000110; // 3
            4'h4: SEG = 7'b1001100; // 4
            4'h5: SEG = 7'b0100100; // 5
            4'h6: SEG = 7'b0100000; // 6
            4'h7: SEG = 7'b0001111; // 7
            4'h8: SEG = 7'b0000000; // 8
            4'h9: SEG = 7'b0001100; // 9
            4'hA: SEG = 7'b0001000; // A
            4'hB: SEG = 7'b1100000; // b
            4'hC: SEG = 7'b0110001; // C
            4'hD: SEG = 7'b1000010; // d
            4'hE: SEG = 7'b0110000; // E
            4'hF: SEG = 7'b0111000; // F
            default: SEG = 7'b1111111; // all off
        endcase
    end
endmodule
