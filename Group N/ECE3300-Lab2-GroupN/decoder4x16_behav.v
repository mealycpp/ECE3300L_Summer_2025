`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California State Polytechnic University Pomona
// Engineer: Student Daniel and Student Kobe
// 
// Create Date: 06/22/2025 05:57:25 PM
// Design Name: 
// Module Name: decoder4x16_gate
// Project Name: Decoder4x16
// Target Devices: ARTIX - 7 Family
// Tool Versions: Vivado 2025.1
// Description: Implement a 4-to-16 decoder with enable input.
// 
// Dependencies: 
// 
// Revision: 1.0
// Revision 0.01 - File Created
// Additional Comments: This has been designed by Student Daniel and Student Kobe
//////////////////////////////////////////////////////////////////////////////////


module decoder4x16_behav(
     input wire [3:0] A, wire[4:4] E,
     output reg [15:0] Y
    );
    always @(E, A, Y) begin
    
    Y = 16'b0; // reset all outputs to 0
        if (E) begin // only decode when enabled
        case (A)
        4'b0000: Y = 16'b0000_0000_0000_0001; // output 0
        4'b0001: Y = 16'b0000_0000_0000_0010; // output 1
        4'b0010: Y = 16'b0000_0000_0000_0100; // output 2
        4'b0011: Y = 16'b0000_0000_0000_1000; // output 3
        4'b0100: Y = 16'b0000_0000_0001_0000; // output 4
        4'b0101: Y = 16'b0000_0000_0010_0000; // output 5
        4'b0110: Y = 16'b0000_0000_0100_0000; // output 6
        4'b0111: Y = 16'b0000_0000_1000_0000; // output 7
        4'b1000: Y = 16'b0000_0001_0000_0000; // output 8
        4'b1001: Y = 16'b0000_0010_0000_0000; // output 9
        4'b1010: Y = 16'b0000_0100_0000_0000; // output 10
        4'b1011: Y = 16'b0000_1000_0000_0000; // output 11
        4'b1100: Y = 16'b0001_0000_0000_0000; // output 12
        4'b1101: Y = 16'b0010_0000_0000_0000; // output 13
        4'b1110: Y = 16'b0100_0000_0000_0000; // output 14
        4'b1111: Y = 16'b1000_0000_0000_0000; // output 15
        
        endcase
        end
    end

   // );
endmodule
