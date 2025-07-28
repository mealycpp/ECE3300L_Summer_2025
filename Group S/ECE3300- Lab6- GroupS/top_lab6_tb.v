`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/27/2025 10:47:12 PM
// Design Name: 
// Module Name: top_lab6_tb
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


module top_lab6_tb;

  reg        CLK   = 0;
  reg        BTN0  = 1;
  reg [8:0]  SW    = 9'b00000001;      

  wire [6:0] SEG;
  wire [7:0] AN;
  wire [7:0] LED;
//instantiate top module
  top_lab6 dut (
      .CLK (CLK),
      .BTN0(BTN0),
      .SW  (SW),
      .LED (LED),
      .AN  (AN),
      .SEG (SEG)
  );


  always #5 CLK = ~CLK;      // 100MHz clock

 initial begin
    #10 BTN0 = 0;           // test reset
    #200                    //Count fowards for 200 ns
    SW = 9'b010000000;      // count backwards for 200 ns 
    #200
    
    //different speeds from fastest->slowest
    
    SW = 9'b010000001;
    #200
    SW = 9'b010000010;
    #200
    SW = 9'b010000100;
    #200
    SW = 9'b000001000;
    #200
    SW = 9'b000010000;
    #1000;            //run till end
    $finish;
end


endmodule