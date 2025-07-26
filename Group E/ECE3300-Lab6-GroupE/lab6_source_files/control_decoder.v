`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 07/24/2025 11:28:54 AM
// Design Name: 
// Module Name: control_decoder
// Project Name: control_decoder
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

module control_decoder(
    input [3:0] ctrl_in,         // {SW8, SW7, SW6, SW5}
    output reg [3:0] ctrl_out    // For 7-segment display
);
    always @(*) begin
        ctrl_out = ctrl_in;
    end
endmodule
