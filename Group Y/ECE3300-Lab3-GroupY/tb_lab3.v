`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: tb_lab3
//////////////////////////////////////////////////////////////////////////////////
module tb_lab3;

  // DUT I/O
  reg         clk, rst;
  reg         btnD, btnR, btnL, btnU;
  reg  [15:0] SW;
  wire        LED0;

  // drive sel procedurally
  reg   [3:0] sel;
  integer     i,j;

  // Instantiate DUT
  top_mux_lab3 uut (
    .clk  (clk),
    .rst  (rst),
    .btnD (btnD),
    .btnR (btnR),
    .btnL (btnL),
    .btnU (btnU),
    .SW   (SW),
    .LED0 (LED0)
  );

  // clock generator
  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end

  // main test
  initial begin
    rst = 1;
    SW = 16'b0;
    btnD = 0; btnR = 0; btnL = 0; btnU = 0;
    #40;
    rst = 0;  // deassert reset

    // sweep through all 16 select values
    for (i = 0; i < 16; i = i + 1) begin
      SW = 16'b0;
      rst=1;
      #40;
      rst=0;
      sel = i[3:0];
      {btnU, btnL, btnR, btnD} = sel;
      #40
      for (j = 0; j < 16; j = j + 1) begin
      SW = 1'b1 << j;
      $display("----- Testing MUX setting %0d  -----", i);
      $display("sel=%b , output = %b, expected_output = %b", sel, LED0, SW[i]);
      #40;
      end
    end
    $finish;
  end

endmodule