`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 10:46:52 PM
// Design Name: 
// Module Name: top_lab6_tb
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


module top_lab6_tb;

    // Inputs
    reg clk;
    reg BTN0;
    reg [8:0] SW;

    // Outputs
    wire [6:0] SEG;
    wire [7:0] AN;
    wire [7:0] LED;

    // Instantiate the top module
    top_lab6 uut (
        .clk(clk),
        .BTN0(BTN0),
        .SW(SW),
        .SEG(SEG),
        .AN(AN),
        .LED(LED)
    );

    // Clock: 100 MHz
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $display("Time\tBTN0\tSW\t\tLED\tSEG\t\tAN");
        $monitor("%0t\t%b\t%b\t%h\t%b\t%b", $time, BTN0, SW, LED, SEG, AN);

        // Initial values
        BTN0 = 1;         // Not pressed (inactive reset)
        SW = 9'b000000000;
        #20;

        // Apply reset
        BTN0 = 0;         // Press reset
        #20;
        BTN0 = 1;         // Release reset

        // Apply clock divider select
        SW[4:0] = 5'd1;   // Slowest division
        SW[7] = 1'b0;     // BCD counter (units) counting up
        SW[8] = 1'b0;     // BCD counter (tens) counting up
        SW[6:5] = 2'b00;  // ALU = A + B
        #100000;

        // Change ALU operation to subtraction
        SW[6:5] = 2'b01;
        #100000;

        // Change direction of units to down, tens up
        SW[7] = 1'b1;
        SW[8] = 1'b0;
        #100000;

        // Test default ALU case
        SW[6:5] = 2'b11;
        #100000;

        // Finish simulation
        $finish;
    end

endmodule

