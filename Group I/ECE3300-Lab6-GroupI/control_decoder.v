`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 01:13:25 PM
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
////////////////////////////////A//////////////////////////////////////////////////


module control_decoder(
    input wire [3:0] switches,      // {SW8, SW7, SW6, SW5}
    output wire [3:0] ctrl_nibble   // for 7-seg display
);
        
        assign ctrl_nibble = switches;
        
endmodule
