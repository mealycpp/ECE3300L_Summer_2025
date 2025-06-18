`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Jonathan Huynh, Adam Godfrey
// 
// Create Date: 06/16/2025 12:37:59 PM
// Design Name: LAB1
// Module Name: switch2LED
// Project Name: Switch to LED Interface
// Target Devices: ARTIX-7 Family
// Tool Versions: Vivaldo 2025.1
// Description: Takes inputs from switches and outputs to LEDs
// 
// Dependencies: 
// 
// Revision: 1.0
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module switch2LED(
                    input wire [15:0] SW,
                    output wire [15:0] LED
                    );
        assign LED = SW;
endmodule
