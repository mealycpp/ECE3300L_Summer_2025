`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2025 06:25:29 PM
// Design Name: 
// Module Name: switch_led_interface
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


module switch_led_interface(
input wire [15:0] x,
output wire [15:0] z
    );
    assign z[15] = x[15];
    assign z[14] = x[14];
    assign z[13] = x[13];
    assign z[12] = x[12];
    assign z[11] = x[11];
    assign z[10] = x[10];
    assign z[9] = x[9];
    assign z[8] = x[8];
    assign z[7] = x[7];
    assign z[6] = x[6];
    assign z[5] = x[5];
    assign z[4] = x[4];
    assign z[3] = x[3];
    assign z[2] = x[2];
    assign z[1] = x[1];
    assign z[0] = x[0];

endmodule
