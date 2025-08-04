`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 08/04/2025 10:53:14 AM
// Design Name: 
// Module Name: shamt_counter
// Project Name: shamt_counter
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

module shamt_counter(
    input wire clk,               
    output reg [1:0] shamt_high   
);

    always @(posedge clk) begin
        shamt_high <= shamt_high + 1;
    end

endmodule
