`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2025 12:56:22 PM
// Design Name: 
// Module Name: switch2LED_top
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


module switch2LED_top(
                    input wire [15:0] sw,
                    output wire [15:0] led
                    );
                
                switch2LED X (
                                .SW (sw),
                                .LED (led)
                                );

endmodule
