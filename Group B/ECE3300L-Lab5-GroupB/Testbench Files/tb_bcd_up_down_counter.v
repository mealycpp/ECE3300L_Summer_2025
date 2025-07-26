`timescale 1ns/1ps
module tb_bcd_up_down_counter;
  reg        clk, rst_n, dir;
  wire [3:0] digit0, digit1;

  // Unit under test
  bcd_up_down_counter uut (
    .clk    (clk),
    .rst_n  (rst_n),
    .dir    (dir),
    .digit0 (digit0),
    .digit1 (digit1)
  );

  initial begin
    clk   = 0;
    rst_n = 0;
    dir   = 1;            // count up
    #20 rst_n = 1;        // release reset

    // count up 12 cycles
    repeat (12) begin
      #10 $display("UP  @%0t  tens=%0d units=%0d", $time, digit1, digit0);
    end

    // switch direction and count down
    dir = 0;
    repeat (12) begin
      #10 $display("DN  @%0t  tens=%0d units=%0d", $time, digit1, digit0);
    end

  end

  // 100 MHz clock
  always #5 clk = ~clk;
endmodule
