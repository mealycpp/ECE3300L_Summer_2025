`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 01:58:01 PM
// Design Name: 
// Module Name: tb_control_decoder
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


module tb_control_decoder();
    reg [3:0] nibble;
    wire [3:0] ctrl_nibble;

    control_decoder uut (.nibble(nibble), .ctrl_nibble(ctrl_nibble));

    initial begin
        nibble = 4'b0000; #10;
        nibble = 4'b1010; #10;
        nibble = 4'b1111; #10;
        $stop;
    end
endmodule