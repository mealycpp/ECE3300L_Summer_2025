`timescale 1ns / 1ps

module seg7_scan_tb;
  reg CLK = 0;
  reg [6:0] SEG;
  wire [7:0] AN;
  reg [11:0] bits;
  seg7_scan uut (
    .CLK(CLK),
    .bits(bits),
    .AN(AN)
  );

  always #5 CLK = ~CLK;

  initial begin

    bits[3:0] = 4261;
    bits[7:4] = 9623;
    bits[11:8] = 2754;
    #500;

    bits[3:0] = 2659;
    bits[7:4] = 5549;
    bits[11:8] = 8236;
    #500;
    $stop;
  end
endmodule
