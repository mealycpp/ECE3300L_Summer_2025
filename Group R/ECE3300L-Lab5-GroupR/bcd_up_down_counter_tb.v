`timescale 1ns/1ps  // Time units and precision for simulation

module bcd_up_down_counter_tb;

  // 🧱 Declare testbench signals (no ports in testbenches)
  reg clk;
  reg rst_n;
  reg dir;
  wire [3:0] digit0;
  wire [3:0] digit1;

  // 🔗 Instantiate the module under test (MUT or DUT)
  bcd_up_down_counter uut (
    .clk(clk),
    .rst_n(rst_n),
    .dir(dir),
    .digit0(digit0),
    .digit1(digit1)
  );

  // ⏰ Generate clock signal (100MHz => 10ns period)
  initial clk = 0;
  always #5 clk = ~clk;  // Toggles every 5ns → 100MHz clock

  // 🧪 Apply stimulus to DUT
  initial begin
    // Initialize
    rst_n = 0;
    dir = 1;      // Start counting up

    // ⏳ Wait for some time then release reset
    #20;
    rst_n = 1;

    // Run for a while in UP mode
    #200;

    // Switch direction to DOWN
    dir = 0;

    // Run for a while in DOWN mode
    #200;

    // Reset again
    rst_n = 0;
    #20;
    rst_n = 1;

    // End simulation
    #100;
    $stop;
  end

  // 🪬 Optionally monitor values
  initial begin
    $monitor("Time = %t | dir = %b | digit1 = %d | digit0 = %d", $time, dir, digit1, digit0);
  end

endmodule
