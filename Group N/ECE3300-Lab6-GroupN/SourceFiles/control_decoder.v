`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2025 08:53:51 PM
// Design Name: 
// Module Name: control_decoder
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


module control_decoder(
    input [3:0] controlSW, // {SW8,SW7,SW6,SW5} 
    output reg [3:0] ctrl_nibble
    );
    
    always@(*)begin
        ctrl_nibble = controlSW;
    end
    
endmodule
