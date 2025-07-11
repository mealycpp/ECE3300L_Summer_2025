`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2025 05:43:39 PM
// Design Name: 
// Module Name: tb_Driver
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


module tb_Driver;

  // Inputs
  reg clk;
  reg rst_n;
  reg [15:0] SW_in;

  // Outputs
  wire [15:0] LED;
  wire [6:0] Cnode;
  wire dp;
  wire [7:0] AN;

  // Instantiate DUT
  Driver uut (
    .clk(clk),
    .rst_n(rst_n),
    .SW_in(SW_in),
    .LED(LED),
    .Cnode(Cnode),
    .dp(dp),
    .AN(AN)
  );

  // 100MHz clock
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Stimulus
  initial begin
    rst_n = 0;
    SW_in = 16'h0000;

    // Hold reset
    #20 rst_n = 1;

    // Set switches to show 'ABCD'
    #50 SW_in = 16'hABCD;

    // Change to '1234'
    #50000 SW_in = 16'h1234;

    // Change to 'FFFF'
    #50000 SW_in = 16'hFFFF;

    // Finish after some time
    #100000 $finish;
  end

endmodule
