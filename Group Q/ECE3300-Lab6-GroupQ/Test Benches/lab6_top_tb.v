`timescale 1ns / 1ps

module top_lab6_tb;
  reg CLK = 0;
  reg rst_n;
  reg [8:0] SW;
  wire [7:0] LED;
  wire [6:0] SEG;
  wire DP;
  wire [7:0] AN;

  top_lab6 uut (
    .CLK(CLK),
    .rst_n(rst_n),
    .SW(SW),
    .LED(LED),
    .SEG(SEG),
    .DP(DP),
    .AN(AN)
  );

  always #5 CLK = ~CLK;

  initial begin
    
    SW = 9'b000000000;
    rst_n = 0;
    #20;

    rst_n = 1;

    SW[4:0] = 5'd0;
    SW[7]   = 1;
    SW[8]   = 1;
    #200;

    SW[7] = 0;
    #200;

    SW[8] = 0;
    #200;

    SW[6:5] = 2'b01;
    #200;

    SW[6:5] = 2'b10;
    #200;

    $stop;
  end
endmodule
