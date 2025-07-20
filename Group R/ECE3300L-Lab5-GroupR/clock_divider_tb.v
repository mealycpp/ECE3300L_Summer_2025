`timescale 1ns / 1ps

module clock_divider_tb;

  reg clk;
  wire [31:0] cnt;

  // Instantiate DUT
  clock_divider uut (
    .clk(clk),
    .cnt(cnt)
  );

  // Generate 100 MHz clock (10 ns period)
  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    $display("Starting clock_divider_tb...");
    #0;
    #1000;  // Wait 1000 ns (should see ~100 rising edges)
    $display("Final count = %d", cnt);
    $stop;
  end
