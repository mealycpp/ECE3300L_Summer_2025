`timescale 1ns / 1ps
module seg7_scan8_tb;
  // Inputs to DUT
  reg        clk_1kHz;
  reg [6:0]  d0, d1, d2, d3, d4, d5, d6, d7;
  // Outputs from DUT
  wire [7:0] AN;
  wire [6:0] SEG;

  // Instantiate DUT
  seg7_scan8 uut (
    .AN(AN),
    .SEG(SEG),
    .clk_1kHz(clk_1kHz),
    .d0(d0), .d1(d1), .d2(d2), .d3(d3),
    .d4(d4), .d5(d5), .d6(d6), .d7(d7)
  );

  // 1 kHz clock generator (period = 1 ms = 1000 ns)
  initial clk_1kHz = 0;
  always #500 clk_1kHz = ~clk_1kHz;

  initial begin
    // Give each digit a unique 7-bit code equal to its index
    d0 = 7'h0;
    d1 = 7'h1;
    d2 = 7'h2;
    d3 = 7'h3;
    d4 = 7'h4;
    d5 = 7'h5;
    d6 = 7'h6;
    d7 = 7'h7;

    // Let it run through twice (16 cycles)
    #16000;
    $finish;
  end

  // Monitor the scan sequence: selects index (via hierarchical name), AN, and SEG
  initial begin
    $display("time(ns)  sel  AN        SEG");
    $monitor("%0t    %d    %b  %b",
             $time,
             uut.selects,
             AN,
             SEG);
  end
endmodule
