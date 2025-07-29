`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Dalton Hoang
// 
// Create Date: 07/25/2025 01:09:36 PM
// Design Name: 
// Module Name: control_decoder
// Project Name: 
// Target Devices: Nexys A7 100T
// Tool Versions: 
// Description: outputs a 4 bit nibble for switch settings in ALU operation and counter directions for 7 seg
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module control_decoder(
    input wire [3:0] ctrl_input,     // SW8, SW7, SW6, SW5
    
    output wire [3:0] ctrl_output    // Goes to 7-segment display
);

    // Pass input directly to output
    assign ctrl_output = ctrl_input;

endmodule
