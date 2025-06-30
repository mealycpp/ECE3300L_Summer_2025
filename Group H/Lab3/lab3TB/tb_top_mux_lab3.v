
`timescale 1ns/1ps

module tb_top_mux_lab3;

  reg clk = 0;
  reg rst;
  reg [15:0] SW;
  reg btnU, btnD, btnL, btnR;
  wire LED0;
  wire [3:0] sel;

  top_mux_lab3 uut (
    .clk(clk),
    .rst(rst),
    .SW(SW),
    .btnU(btnU),
    .btnD(btnD),
    .btnL(btnL),
    .btnR(btnR),
    .LED0(LED0),
    .sel(sel)
  );

  always #5 clk = ~clk;  // 100MHz clock (10ns period)

  initial begin
    rst = 1;
    SW = 16'hAAAA;
    btnU = 0; btnD = 0; btnL = 0; btnR = 0;
    #100 rst = 0;

    // Simulate button presses
    #500 btnD = 1; #1000 btnD = 0; #1000;
    btnR = 1; #1000 btnR = 0; #1000;
    btnL = 1; #1000 btnL = 0; #1000;
    btnU = 1; #1000 btnU = 0; #1000;

    #5000;
    $finish;
  end

endmodule
