`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 09:33:36 PM
// Design Name: 
// Module Name: seg7_scan_tb
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


module seg7_scan_tb();

    reg clk;
    reg rst;
    reg [3:0] control;
    reg [7:0] bits;
    wire [6:0] SEG;
    wire [7:0] AN;

    // Instantiate seg7_scan
    seg7_scan uut (.clk(clk), .rst(rst), .control(control), .bits(bits), .SEG(SEG), .AN(AN));

    //Clock 
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Display header
    initial begin
        $display("Time\tclk\trst\tcontrol\tbits\t\tSEG\t\tAN");
        $monitor("%0t\t%b\t%b\t%h\t%h\t%b\t%b", $time, clk, rst, control, bits, SEG, AN);
    end

    initial begin
    // Initialize inputs
    rst = 1;
    control = 4'hF;
    bits = 8'h21;

    // Test reset
    #20 rst = 0;
    #500;

    // Try new input
    bits = 8'hA5;
    control = 4'h3;
    #500;

    // Reset Test 2
    rst = 1; #10; rst = 0;
    #300;
    $finish;
    end

endmodule