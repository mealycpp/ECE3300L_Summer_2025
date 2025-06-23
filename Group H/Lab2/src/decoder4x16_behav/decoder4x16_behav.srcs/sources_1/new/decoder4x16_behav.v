`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2025 11:01:15 AM
// Design Name: 
// Module Name: decoder4x16_behav
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
    input  [3:0] A,
    input        E,
    output reg [15:0] Y
);

always @(*) begin
    Y = 16'b0;                 // 🟩 reset all outputs to 0
    if (E) begin               // 🟦 only decode when enabled
        case (A)
            4'b0000: Y = 16'b0000_0000_0000_0001; // 🟧 output 0
            4'b0001: Y = 16'b0000_0000_0000_0010;
            4'b0010: Y = 16'b0000_0000_0000_0100;
            4'b0011: Y = 16'b0000_0000_0000_1000;
            4'b0100: Y = 16'b0000_0000_0001_0000;
            4'b0101: Y = 16'b0000_0000_0010_0000;
            4'b0110: Y = 16'b0000_0000_0100_0000;
            4'b0111: Y = 16'b0000_0000_1000_0000;
            4'b1000: Y = 16'b0000_0001_0000_0000;
            4'b1001: Y = 16'b0000_0010_0000_0000;
            4'b1010: Y = 16'b0000_0100_0000_0000;
            4'b1011: Y = 16'b0000_1000_0000_0000;
            4'b1100: Y = 16'b0001_0000_0000_0000;
            4'b1101: Y = 16'b0010_0000_0000_0000;
            4'b1110: Y = 16'b0100_0000_0000_0000;
            4'b1111: Y = 16'b1000_0000_0000_0000;
        endcase
    end
end

endmodule
