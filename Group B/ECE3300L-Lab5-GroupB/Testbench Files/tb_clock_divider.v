`timescale 1ns/1ps
module tb_clock_divider;
  reg         clk;
  reg         rst_n;
  wire [31:0] count;

  // Unit under test
  clock_divider uut (
    .clk   (clk),
    .rst_n (rst_n),
    .count (count)
  );

  initial begin
    clk   = 0;
    rst_n = 0;
    #20 rst_n = 1;         // release reset

    // print count every 200 ns
    repeat (10) begin
      #200;
      $display("[%0t] count = %0d", $time, count);
    end
    $finish;
  end

  // 100 MHz clock
  always #5 clk = ~clk;
endmodule