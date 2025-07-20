`timescale 1ns / 1ps

module top_lab5_tb;

  reg CLK;
  reg BTN0;  // reset_n (active low)
  reg BTN1;  // direction
  reg [4:0] SW;

  wire [1:0] AN;
  wire [6:0] SEG;
  wire [7:0] LED;

  // Instantiate DUT
  top_lab5 uut (
    .CLK(CLK),
    .BTN0(BTN0),
    .BTN1(BTN1),
    .SW(SW),
    .AN(AN),
    .SEG(SEG),
    .LED(LED)
  );

  // Clock generator
  initial CLK = 0;
  always #5 CLK = ~CLK;

  initial begin
    $display("Starting top_lab5_tb...");

    // Reset active
    BTN0 = 0;
    BTN1 = 1;  // Count up
    SW = 5'd0; // Slowest clock (good for simulation)

    #20;
    BTN0 = 1; // Release reset

    // Run for some time
    #2000;

    // Change direction
    BTN1 = 0;
    #2000;

    // Assert reset again
    BTN0 = 0;
    #20;
    BTN0 = 1;

    #1000;
    $stop;
  end

endmodule
