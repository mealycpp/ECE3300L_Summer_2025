`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 01:58:38 PM
// Design Name: 
// Module Name: tb_top_lab6
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


module tb_top_lab6;
    reg clk;
    reg BTN0;
    reg [8:0] SW;
    wire [2:0] AN;
    wire [6:0] SEG;

    // Instantiate the top module
    top_lab6 uut (
        .clk(clk),
        .BTN0(BTN0),
        .SW(SW),
        .AN(AN),
        .SEG(SEG)
    );

    // Clock generation (100 MHz -> 10 ns period)
    initial clk = 0;
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize
        BTN0 = 1;
        SW = 9'b000000000; // Default values

        // Apply reset
        #20 BTN0 = 0;
        #20 BTN0 = 1;

        // Simulate counting and ALU operation
        SW[4:0] = 5'd20;     // Set slow clock divide rate (counter[20])
        SW[6:5] = 2'b00;     // ALU = A + B
        SW[8]   = 1'b0;      // Direction = down
        
        #100000; // Wait and observe counter + ALU

        SW[8] = 1'b1; // Change direction to up
        #100000;

        SW[6:5] = 2'b01; // Change ALU operation to subtract
        #100000;

        SW[6:5] = 2'b10; // Undefined operation (default to 0)
        #100000;

        $stop;
    end
endmodule