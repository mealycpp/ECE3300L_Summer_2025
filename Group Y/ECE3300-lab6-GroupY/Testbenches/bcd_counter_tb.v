`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 08:48:39 PM
// Design Name: 
// Module Name: bcd_counter_tb
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


module bcd_counter_tb();

reg clk;
reg btn0;
reg dir;
wire [3:0] digit;
wire rollover;

bcd_counter uut (
.clk(clk),
.btn0(btn0),
.dir(dir),
.digit(digit),
.rollover(rollover)
    );

    initial begin 
    clk = 0;
    forever #5 clk = ~clk;
    end
    initial begin
        $display("Time\tclk\tbtn0\tdir\tdigit\trollover");
        $monitor("%0t\t%b\t%b\t%b\t%d\t%b", 
                  $time, clk, btn0, dir, digit, rollover);
    end

    initial begin
        btn0 = 1;  
        dir = 0;   
        
        #20;
        btn0 = 0; 
        
        repeat (10) @(posedge clk);

        @(posedge clk); 
        dir = 1;
        repeat (1) @(posedge clk);  
        repeat (9) @(posedge clk);  
        btn0 = 1;
        @(posedge clk);
        btn0 = 0;

        repeat (3) @(posedge clk); 
        dir = 1; @(posedge clk);   
        dir = 0; @(posedge clk);  
        $finish;
    end
endmodule


