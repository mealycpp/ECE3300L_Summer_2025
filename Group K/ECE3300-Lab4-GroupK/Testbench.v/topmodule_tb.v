`timescale 1ns / 1ps

module topmodule_tb;

  // Testbench signals
  reg clk;
  reg rst_n;
  reg [15:0] SW;
  wire [15:0] led;
  wire [6:0] Cnode;
  wire dp;
  wire [7:0] AN;

  // Instantiate DUT
  topmodule uut (
    .clk(clk),
    .rst_n(rst_n),
    .SW(SW),
    .led(led),
    .Cnode(Cnode),
    .dp(dp),
    .AN(AN)
  );

  // Generate 100 MHz clock
  always #5 clk = ~clk;

  initial begin
    // Initialize signals
    clk = 0;
    rst_n = 0;
    SW = 16'h0000;

    // Reset pulse
    #50;
    rst_n = 1;

    // Cycle through test cases every 1 ms
    SW = 16'h1234; // Test case 1
    #1_000_000;

    SW = 16'hABCD; // Test case 2
    #1_000_000;

    SW = 16'hF2A1; // Test case 3
    #1_000_000;

    SW = 16'h0000; // All off
    #1_000_000;

    SW = 16'h9876; // Test case 4
    #1_000_000;

    SW = 16'h5E0F; // Test case 5
    #1_000_000;

    $stop; // End simulation
  end

endmodule