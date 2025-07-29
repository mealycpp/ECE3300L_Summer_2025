`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2025 05:34:43 PM
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
    input [3:0] ctrl_in,
    output reg [3:0] ctrl_out
    );
    
    always@(*)begin
        ctrl_out = ctrl_in;
    end
    
endmodule
