`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 05:46:21 PM
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
    input [3:0] ctrl_in, //input switch values
    output reg [3:0] ctrl_out //output for control encoding
);
    always @(*) begin
        ctrl_out = ctrl_in; //assigns SW values to control out
    end
endmodule

