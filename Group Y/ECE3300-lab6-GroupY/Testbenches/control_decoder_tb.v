`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 08:52:38 PM
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
    wire [3:0] ctrl_out;

    control_decoder uut (
        .ctrl_in(ctrl_in),
        .ctrl_out(ctrl_out)
    );

    initial begin
        $monitor("Time = %0t , ctrl_in = %b , ctrl_out = %b", $time, ctrl_in, ctrl_out);
    end

    // Stimulus
    initial begin
        ctrl_in = 4'b0000;
        #10;
        ctrl_in = 4'b0001; 
        #10;
        ctrl_in = 4'b0010; 
        #10;
        ctrl_in = 4'b0011; 
        #10;
        ctrl_in = 4'b0100; 
        #10;
        ctrl_in = 4'b0101; 
        #10;
        ctrl_in = 4'b0110; 
        #10;
        ctrl_in = 4'b0111; 
        #10;
         ctrl_in = 4'b1000; 
        #10;
         ctrl_in = 4'b1001; 
        #10;
        $finish;
    end


endmodule
