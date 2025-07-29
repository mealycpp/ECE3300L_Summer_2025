`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Andy Siu
// 
// Create Date: 07/28/2025 06:47:34 PM
// Design Name: 
// Module Name: control_decoder_tb
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

module tb_control_decoder;

    reg [3:0] ctrl_in;

    wire [3:0] ctrl_out;

    control_decoder uut (
        .ctrl_in(ctrl_in),
        .ctrl_out(ctrl_out)
    );

    initial begin
    
        ctrl_in = 4'b0000; #10;
        ctrl_in = 4'b0001; #10;
        ctrl_in = 4'b0010; #10;
        ctrl_in = 4'b0011; #10;
        ctrl_in = 4'b0100; #10;
        ctrl_in = 4'b0101; #10;
        ctrl_in = 4'b0110; #10;
        ctrl_in = 4'b0111; #10;
        ctrl_in = 4'b1000; #10;
        ctrl_in = 4'b1001; #10;
        ctrl_in = 4'b1010; #10;
        ctrl_in = 4'b1011; #10;
        ctrl_in = 4'b1100; #10;
        ctrl_in = 4'b1101; #10;
        ctrl_in = 4'b1110; #10;
        ctrl_in = 4'b1111; #10;
        $finish;
    end

endmodule