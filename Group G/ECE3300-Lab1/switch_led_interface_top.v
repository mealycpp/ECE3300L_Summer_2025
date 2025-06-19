`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2025 06:26:31 PM
// Design Name: 
// Module Name: switch_led_interface_top
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


module switch_led_interface_top(
              input wire[15:0] sw,
              output wire[15:0] led
    );
    
        switch_led_interface X4 (
              .x(sw),
              .z(led)
        );
    
    
endmodule
