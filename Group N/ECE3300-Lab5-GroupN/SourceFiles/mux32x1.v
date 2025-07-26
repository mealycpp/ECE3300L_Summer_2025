`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2025 05:07:59 PM
// Design Name: 
// Module Name: top_lab5
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


module mux32x1(
    input [31:0] cnt, 
    input [4:0] sel, // speed selector (0-31), 0 being slowest 
    output clk_out //divided clock 
 
    );
    
    assign clk_out = cnt[31 - sel]; // without 31 - : this would be inverted on the physical switches
    
    
endmodule
