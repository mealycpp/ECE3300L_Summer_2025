`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2025 04:18:38 PM
// Design Name: 
// Module Name: seg_7_driver_tb
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


`timescale 1ns/1ps
module seg7_driver_tb;
  reg         clk = 0;
  reg         rst_n;
  reg [31:0]  SW;
  wire [6:0]  Cnode;
  wire        dp;
  wire [7:0]  AN;

  // Instantiate UUT
  seg7_driver uut (
    .clk(clk), .rst_n(rst_n),
    .SW(SW),   .Cnode(Cnode),
    .dp(dp),   .AN(AN)
  );

  // 10 ns clock
  always #5 clk = ~clk;

  initial begin
    // reset
    rst_n = 0; SW = 0;
    #20 rst_n = 1;

    // test pattern 0x0 → digit 0
    SW = 32'h0000_0000; #200;

    // test pattern 0xF on first digit
    SW = 32'h0000_000F; #200;

    // test alternating nibble values
    SW = 32'hA5A5_A5A5; #200;

    $finish;
  end
endmodule
