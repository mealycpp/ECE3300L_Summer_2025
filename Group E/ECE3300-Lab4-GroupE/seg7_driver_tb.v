`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 07/09/2025 11:20:29 AM
// Design Name: 
// Module Name: seg7_driver_tb
// Project Name: seg7_driver_tb
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

module seg7_driver_tb;

  // Inputs 
  reg clk_tb;
  reg rst_n;
  reg [31:0] SW_tb;

  // Outputs
  wire [6:0] Cnode_tb;
  wire [7:0] AN_tb;
  wire dp_tb;

  // Instantiate
  seg7_driver DUT (
    .clk(clk_tb),
    .rst_n(rst_n),
    .SW(SW_tb),
    .Cnode(Cnode_tb),
    .AN(AN_tb),
    .dp(dp_tb)
  );

  // 100 MHz clock (10 ns period)
  always #5 clk_tb = ~clk_tb;

  initial begin
    // Initialize signals
    clk_tb = 0;
    rst_n = 0;
    SW_tb = 32'h00000000;

    // Apply reset
    #20 rst_n = 1;

    // Apply switch input
    #10 SW_tb = 32'h1234ABCD;  

    #100000;  // 100 us

    $display("Simulation finished.");
    $stop;
  end
endmodule
