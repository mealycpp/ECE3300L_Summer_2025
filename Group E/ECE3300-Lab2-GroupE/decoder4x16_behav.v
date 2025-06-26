`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Paul Kim and Winson Zhu
// 
// Create Date: 06/19/2025 08:27:34 PM
// Design Name: 
// Module Name: decoder4x16_behav
// Project Name: decoder4x16_behav
// Target Devices: ARTIX - 7 Family
// Tool Versions: Vivado 2025.1
// Description: 4-to-16 decoder with enable.
// 
// Dependencies: 
// 
// Revision: 1.0
// Revision 0.01 - File Created
// Additional Comments: 
//////////////////////////////////////////////////////////////////////////////////


module decoder4x16_behav(
     input wire [3:0] sw, e,
     output reg [15:0] led
    );
  always @(*) begin
    
    led = 16'b0; // ▶ reset all outputs to 0
        if (e) begin // ▶ only decode when enabled
        case (sw)
        4'b0000:led=16'b0000_0000_0000_0001; // ▶ output 0
        4'b0001:led=16'b0000_0000_0000_0010; // ▶ output 1
        4'b0010:led=16'b0000_0000_0000_0100; // ▶ output 2
        4'b0011:led=16'b0000_0000_0000_1000; // ▶ output 3
        4'b0100:led=16'b0000_0000_0001_0000; // ▶ output 4
        4'b0101:led=16'b0000_0000_0010_0000; // ▶ output 5
        4'b0110:led=16'b0000_0000_0100_0000; // ▶ output 6
        4'b0111:led=16'b0000_0000_1000_0000; // ▶ output 7
        4'b1000:led=16'b0000_0001_0000_0000; // ▶ output 8
        4'b1001:led=16'b0000_0010_0000_0000; // ▶ output 9
        4'b1010:led=16'b0000_0100_0000_0000; // ▶ output 10
        4'b1011:led=16'b0000_1000_0000_0000; // ▶ output 11
        4'b1100:led=16'b0001_0000_0000_0000; // ▶ output 12
        4'b1101:led=16'b0010_0000_0000_0000; // ▶ output 13
        4'b1110:led=16'b0100_0000_0000_0000; // ▶ output 14
        4'b1111:led=16'b1000_0000_0000_0000; // ▶ output 15    
        endcase
        end
    end 
endmodule

