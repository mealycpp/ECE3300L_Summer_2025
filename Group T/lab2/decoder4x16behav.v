`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Kevin Yu and 
// 
// Create Date: 06/25/2025 09:45:30 PM
// Design Name: 4x16 Decoder
// Module Name: gates4
// Project Name: Lab 2 Decoder
// Target Devices: 
// Tool Versions: 
// Description: Making 4x16 Decoder
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Group T
// 
//////////////////////////////////////////////////////////////////////////////////


module demux4to16(
    input wire [3:0] A,
    input wire E,
    output reg [15:0] Y
    );
    
    always @(*) begin
    Y = 16'b0;
    if (E) begin // ▶ only decode when enabled
       case (A)
        4'b0000: Y = 16'b0000_0000_0000_0001; // ▶ output 0
        4'b0001: Y = 16'b0000_0000_0000_0010; // ▶ output 1
        4'b0010: Y = 16'b0000_0000_0000_0100; // ▶ output 2
        4'b0011: Y = 16'b0000_0000_0000_1000; // ▶ output 3
        4'b0100: Y = 16'b0000_0000_0001_0000; // ▶ output 4
        4'b0101: Y = 16'b0000_0000_0010_0000; // ▶ output 5
        4'b0110: Y = 16'b0000_0000_0100_0000; // ▶ output 6
        4'b0111: Y = 16'b0000_0000_1000_0000; // ▶ output 7
        4'b1000: Y = 16'b0000_0001_0000_0000; // ▶ output 8
        4'b1001: Y = 16'b0000_0010_0000_0000; // ▶ output 9
        4'b1010: Y = 16'b0000_0100_0000_0000; // ▶ output 10
        4'b1011: Y = 16'b0000_1000_0000_0000; // ▶ output 11
        4'b1100: Y = 16'b0001_0000_0000_0000; // ▶ output 12
        4'b1101: Y = 16'b0010_0000_0000_0000; // ▶ output 13
        4'b1110: Y = 16'b0100_0000_0000_0000; // ▶ output 14
        4'b1111: Y = 16'b1000_0000_0000_0000; // ▶ output 15
       endcase
      end
    end
endmodule
