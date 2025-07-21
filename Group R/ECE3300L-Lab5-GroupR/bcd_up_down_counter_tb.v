`timescale 1ns/1ps  // Time units and precision for simulation

module bcd_up_down_counter_tb;

  reg clk;
  reg rst_n;
  reg dir;
  wire [3:0] digit0;
  wire [3:0] digit1;

  bcd_up_down_counter uut (
    .clk(clk),
    .rst_n(rst_n),
    .dir(dir),
    .digit0(digit0),
    .digit1(digit1)
  );

  initial clk = 0;
  always #5 clk = ~clk;  // Toggles every 5ns → 100MHz clock

  initial begin
    rst_n = 0;
    dir = 1;      // Start counting up

    #20;
    rst_n = 1;

    #200;

    dir = 0;

    #200;

    rst_n = 0;
    #20;
    rst_n = 1;

    #100;
    $stop;
  end

  initial begin
    $monitor("Time = %t | dir = %b | digit1 = %d | digit0 = %d", $time, dir, digit1, digit0);
  end

endmodule
