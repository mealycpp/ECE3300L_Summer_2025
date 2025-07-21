`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2025 03:20:47 PM
// Design Name: 
// Module Name: top_lab5_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_lab5_tb;

  reg        CLK   = 0;
  reg        BTN0  = 1;      // reset 
  reg        BTN1  = 0;      // 0 = up, 1 = down
  reg [4:0]  SW    = 0;      

  wire [6:0] SEG;
  wire [7:0] AN;
  wire [12:0] LED;
//instantiate top module
  top_lab5 dut (
      .CLK (CLK),
      .BTN0(BTN0),
      .BTN1(BTN1),
      .SW  (SW),
      .SEG (SEG),
      .AN  (AN),
      .LED (LED)
  );


  always #5 CLK = ~CLK;      // 100MHz clock

  initial begin
      // hold reset 100 ns
      #100  BTN0 = 0;

      // let it count up 1 ms
      #1_000_000;

      // reverse direction for 50 µs
      BTN1 = 1;  #50_000;  BTN1 = 0;

      // run another 1 ms
      #1_000_000;

      $finish;
  end


endmodule


