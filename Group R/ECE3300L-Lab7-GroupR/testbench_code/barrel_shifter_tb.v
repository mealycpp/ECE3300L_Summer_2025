`timescale 1ns/1ps
module barrel_shifter_tb;
  reg  [15:0] data_in;
  reg  [3:0]  shamt;
  reg         dir, rotate, clk;
  wire [15:0] data_out;

  // instantiate DUT
  barrel_shifter16 uut (
    .data_in(data_in),
    .shamt(shamt),
    .dir(dir),
    .rotate(rotate),
    .data_out(data_out)
  );

  // free-running clock
  initial clk = 0;
  always #5 clk = ~clk;

  // increment shift-amount on each rising edge
  always @(posedge clk) begin
    shamt <= shamt + 1;
  end

  initial begin
    data_in = 16'hA2B3;
    shamt   = 4'd0;
    dir     = 1'b0;
    rotate  = 1'b0;
    #200;
    data_in = 16'hA2B3;
    shamt   = 4'd0;
    dir     = 1'b1;
    rotate  = 1'b1;
    #200;
    data_in = 16'h8001;
    shamt   = 4'd0;
    dir     = 1'b0;
    rotate  = 1'b1;
    #200;
    $stop;
  end
endmodule
