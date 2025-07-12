`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2025 05:50:42 PM
// Design Name: 
// Module Name: decoder4x16_gate
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


module decoder4x16_behav(
    input      [3:0]  A,
    input             E,
    output reg [15:0] Y
);

always @(*) begin
    Y = 16'b0;               // ▶ Green: reset all outputs to 0
    if (E) begin             // ▶ Blue: only decode when enabled
        case (A)
            4'b0000: Y = 16'b0000_0000_0000_0001; // ▶ Orange: output 0
            4'b0001: Y = 16'b0000_0000_0000_0010; // ▶ Orange: output 1
            4'b0010: Y = 16'b0000_0000_0000_0100; // ▶ Orange: output 2
            4'b0011: Y = 16'b0000_0000_0000_1000; // ▶ Orange: output 3
            4'b0100: Y = 16'b0000_0000_0001_0000; // ▶ Orange: output 4
            4'b0101: Y = 16'b0000_0000_0010_0000; // ▶ Orange: output 5
            4'b0110: Y = 16'b0000_0000_0100_0000; // ▶ Orange: output 6
            4'b0111: Y = 16'b0000_0000_1000_0000; // ▶ Orange: output 7
            4'b1000: Y = 16'b0000_0001_0000_0000; // ▶ Orange: output 8
            4'b1001: Y = 16'b0000_0010_0000_0000; // ▶ Orange: output 9
            4'b1010: Y = 16'b0000_0100_0000_0000; // ▶ Orange: output 10
            4'b1011: Y = 16'b0000_1000_0000_0000; // ▶ Orange: output 11
            4'b1100: Y = 16'b0001_0000_0000_0000; // ▶ Orange: output 12
            4'b1101: Y = 16'b0010_0000_0000_0000; // ▶ Orange: output 13
            4'b1110: Y = 16'b0100_0000_0000_0000; // ▶ Orange: output 14
            4'b1111: Y = 16'b1000_0000_0000_0000; // ▶ Orange: output 15
        endcase
    end
end

endmodule


