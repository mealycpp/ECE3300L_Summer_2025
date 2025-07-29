`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 09:44:55 PM
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


module top_lab6_tb();

reg clk;
reg btn0;
reg [8:0] SW;

wire [6:0] SEG;
wire [7:0] LED;
wire [7:0] AN;

top_lab6 uut (
    .SW(SW),
    .clk(clk),
    .btn0(btn0),
    .SEG(SEG),
    .LED(LED),
    .AN(AN)
);

    // Clock 100MHz
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Monitoring
    initial begin
        $display("Time\tclk\tbtn0\tSW[8:0]\t\tLED\t\tSEG\t\tAN");
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b", $time, clk, btn0, SW, LED, SEG, AN);
    end

        initial begin
        // Initial values
        btn0 = 1;           // Reset
        SW = 9'b000000000;  // All inputs zero

        #20 btn0 = 0;        // Reset off

        // Set a speed select
        SW[4:0] = 5'b00001; // Slowest speed

        // Count up on both counters
        SW[7] = 0; // dir for ones_counter = up
        SW[8] = 0; // dir for tens_counter = up

        // ALU mode
        SW[6:5] = 2'b00;

        // Counters increment
        repeat (50) @(posedge clk);

        // Change direction for ones_counter
        SW[7] = 1;
        repeat (20) @(posedge clk);

        // Change ALU mode: subtract (SW[6:5] = 01)
        SW[6:5] = 2'b01;
        repeat (20) @(posedge clk);

        // Change control input to test control_decoder and ALU display
        SW[8] = 1;
        SW[6:5] = 2'b10;
        repeat (20) @(posedge clk);

        // Trigger a reset mid-cycle
        btn0 = 1; #10; btn0 = 0;

        // Let things run briefly
        repeat (20) @(posedge clk);

        $finish;
    end

endmodule