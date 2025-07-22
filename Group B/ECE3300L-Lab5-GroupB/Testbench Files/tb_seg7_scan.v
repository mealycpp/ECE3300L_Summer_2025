`timescale 1ns/1ps
module tb_seg7_scan;
  reg        clk, rst_n;
  reg  [3:0] digit0, digit1;
  wire [7:0] an;
  wire [6:0] seg;

  // Unit under test 
  seg7_scan uut (
    .clk    (clk),
    .rst_n  (rst_n),
    .digit0 (digit0),
    .digit1 (digit1),
    .an     (an),
    .seg    (seg)
  );

  initial begin
    clk    = 0;
    rst_n  = 0;
    digit0 = 4'd5;    // units = 5
    digit1 = 4'd2;    // tens  = 2
    #20 rst_n = 1;    // release reset

    // watch a few multiplex cycles
    repeat (16) begin
      #100;
      $display("time=%0t  AN=%b  SEG=%b", $time, an, seg);
    end
    $finish;
  end

  // 100 MHz clock
  always #5 clk = ~clk;
endmodule