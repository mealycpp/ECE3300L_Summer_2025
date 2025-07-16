`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 07/16/2025 11:05:54 AM
// Design Name: 
// Module Name: clock_divider
// Project Name: clock_divider
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

module mux32x1 (
  input [31:0] cnt,     
    input [4:0] sel,    
    output clk_out            
);
    assign clk_out = cnt[sel];  // Output the selected bit from D
endmodule
