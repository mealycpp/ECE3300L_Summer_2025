`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2025 03:50:40 PM
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


module control_decoder_tb(
);
    
    reg [3:0] ctrl_in;
    wire [3:0] ctrl_nibble;

    control_decoder uut (
        .ctrl_in(ctrl_in),
        .ctrl_nibble(ctrl_nibble)
    );

    initial begin
        ctrl_in = 3'b000; #10;
        ctrl_in = 3'b001; #10;
        ctrl_in = 3'b010; #10;
        ctrl_in = 3'b011; #10;
        ctrl_in = 3'b100; #10;
        ctrl_in = 3'b101; #10;
        ctrl_in = 3'b110; #10;
        ctrl_in = 3'b111; #10;
        $finish;
    end

endmodule
