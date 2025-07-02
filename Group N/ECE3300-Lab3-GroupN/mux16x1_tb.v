`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2025 04:10:49 PM
// Design Name: 
// Module Name: mux16x1_tb
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

module mux16x1_tb;

  reg [15:0] in;
  reg [3:0] sel;

  
  wire out;

  mux16x1 uut (
    .in(in),
    .sel(sel),
    .out(out)
  );

  initial begin
    //Test pattern
    for(integer j = 0; j < 16; j = j + 1) begin
        in = 2 ** j; // 2 to the power of j
        sel = j;
        
    $display("----- Testing pattern: = %b -----", in);
    $display("sel=%b , output = %b, expected_output = %b",  sel, out, in[j]);
    
    #5;
    end 
    
    $finish;
    
  end

endmodule
