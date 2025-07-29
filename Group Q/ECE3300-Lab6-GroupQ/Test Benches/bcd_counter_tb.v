`timescale 1ns / 1ps

module bcd_counter_tb;
  reg CLK = 0;
  reg rst_n = 0;
  reg dir = 1;  // 1 = up, 0 = down
  wire [3:0] bcd;

    bcd_counter uut (
    .clk_div(CLK),
    .rst_n(rst_n),
    .dir_bit(dir),
    .digit(bcd)
  );

  always #10 CLK = ~CLK;

  initial begin
    rst_n = 0; #20;
    rst_n = 1;
    #200;
    dir = 0;
    #200;
    $stop;
  end
endmodule
