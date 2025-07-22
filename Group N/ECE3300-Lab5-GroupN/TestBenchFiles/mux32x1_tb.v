`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2025 04:43:41 PM
// Design Name: 
// Module Name: mux32x1_tb
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


module mux32x1_tb(

    );
  reg clk = 0, rst_n = 0;
  reg [31:0] cnt = 0;
  reg [4:0]  sel = 0;
  wire       clk_out;

  mux32x1 uut (.cnt(cnt), .sel(sel), .clk_out(clk_out));

  always #5 clk = ~clk;

  always @(posedge clk or negedge rst_n)
    if (!rst_n) cnt <= 0;
    else        cnt <= cnt + 1;

  initial begin
    #20 rst_n = 1;

    repeat (32) begin
      #100 sel = sel + 1;   
    end

    #200;
    $finish;
  end
    
    
endmodule
