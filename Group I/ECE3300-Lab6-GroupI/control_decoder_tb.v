`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 10:33:24 PM
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



module control_decoder_tb;

    // Testbench signals
    reg [3:0] switches;
    wire [3:0] ctrl_nibble;

    // Instantiate the module under test
    control_decoder uut (
        .switches(switches),
        .ctrl_nibble(ctrl_nibble)
    );

    initial begin
        $display("Time\tSwitches\tCtrl_Nibble");
        $monitor("%0t\t%b\t\t%b", $time, switches, ctrl_nibble);

        // Apply different test values
        switches = 4'b0000; #10;
        switches = 4'b0001; #10;
        switches = 4'b1010; #10;
        switches = 4'b1111; #10;
        switches = 4'b0101; #10;

        // End simulation
        $finish;
    end

endmodule