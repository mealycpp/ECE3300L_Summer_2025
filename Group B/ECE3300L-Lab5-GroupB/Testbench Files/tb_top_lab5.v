`timescale 1ns / 1ps

module tb_top_lab5;
  // Inputs
  reg CLK;
  reg [4:0] SW;
  reg BTN0;    // pushbutton, active low input to DUT -> rst_n = ~BTN0
  reg BTN1;    // direction button: 1=Up, 0=Down

  // Outputs
  wire [7:0] AN;
  wire [6:0] SEG;
  wire [4:0] LED_SW;
  wire [7:0] LED_BCD;

  // Instantiate DUT
  top_lab5 dut (
    .CLK    (CLK),
    .SW     (SW),
    .BTN0   (BTN0),
    .BTN1   (BTN1),
    .AN     (AN),
    .SEG    (SEG),
    .LED_SW (LED_SW),
    .LED_BCD(LED_BCD)
  );

  // 100 MHz clock
  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;
  end

  // Display time in nanoseconds
  initial begin
    $timeformat(-9, 0, " ns", 12);
  end

  initial begin
    // INITIAL RESET
    BTN0 = 1'b1;
    SW   = 5'd0;
    BTN1 = 1'b0;

    #20;
    // Release reset: BTN0=0 -> rst_n=1
    BTN0 = 1'b0;
    $display("%0t: Released reset, LED_BCD = %0d (tens=%0d, units=%0d)",
             $time, LED_BCD, LED_BCD[7:4], LED_BCD[3:0]);

    // Select a mid-range speed for visible counting (e.g. SW=4)
    SW = 5'd4;
    $display("%0t: SW set to %0b", $time, SW);

    // Direction up
    BTN1 = 1'b1;
    $display("%0t: Direction = Up", $time);

    // Monitor 10 increments
    repeat (10) begin
      #320;
      $display("%0t: LED_BCD = %0d (tens=%0d, units=%0d)",
               $time, LED_BCD, LED_BCD[7:4], LED_BCD[3:0]);
    end
  end
endmodule