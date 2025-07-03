`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2025 03:50:03 PM
// Design Name: 
// Module Name: top_mux_lab3_testbench
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

module top_mux_lab3_testbench;

    // Testbench signals
    reg clk = 0;
    reg rst = 1;
    reg [15:0] SW = 0;
    reg btnU = 0;
    reg btnD = 0;
    reg btnL = 0;
    reg btnR = 0;

    wire LED0;

    // Instantiate the Unit Under Test (UUT)
    top_mux_lab3 uut (
        .clk(clk),
        .rst(rst),
        .SW(SW),
        .btnU(btnU),
        .btnD(btnD),
        .btnL(btnL),
        .btnR(btnR),
        .LED0(LED0)
    );

    // Clock generation: 100 MHz (10 ns period)
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        // Reset pulse
        #10 rst = 0;

        // Default input state
        SW = 16'b0000_0000_0000_0001;

        // Simulate pressing btnD to set sel[0]
        #20 btnD = 1;
        #20 btnD = 0;

        // Change switch value and press another button
        SW = 16'b0000_0000_0000_0010;
        #20 btnR = 1;
        #20 btnR = 0;

        // Continue toggling buttons
        SW = 16'b0000_0000_0000_0100;
        #20 btnL = 1;
        #20 btnL = 0;

        SW = 16'b0000_0000_0000_1000;
        #20 btnU = 1;
        #20 btnU = 0;

        // Wait and end simulation
        #100;
        $stop;
    end

endmodule

