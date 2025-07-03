`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2025 11:05:51 AM
// Design Name: 
// Module Name: tb_decoder4x16
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


`timescale 1ns / 1ps

module tb_decoder4x16;

reg  [3:0] A;
reg        E;
wire [15:0] Y;

// DUT: Choose one of the following:

// Uncomment to test GATE-LEVEL version:
// decoder4x16_gate dut ( .A(A), .E(E), .Y(Y) );

// Uncomment to test BEHAVIORAL version:
decoder4x16_behav dut ( .A(A), .E(E), .Y(Y) );

integer i;

initial begin
  $display("---- Starting 4x16 Decoder Test ----");

  // Test Enable OFF
  E = 0;
  A = 4'b0000;
  #10;
  if (Y !== 16'b0) begin
    $display("FAIL: Enable OFF test failed. Y = %b", Y);
    $fatal;
  end else begin
    $display("PASS: Enable OFF outputs all zero");
  end

  // Enable ON
  E = 1;
  for (i = 0; i < 16; i = i + 1) begin
    A = i;
    #10;
    if (Y !== (1 << i)) begin
      $display("FAIL: A = %b, Expected Y = %b, Got Y = %b", A, (1 << i), Y);
      $fatal;
    end else begin
      $display("PASS: A = %b, Y = %b", A, Y);
    end
  end

  $display("---- ALL TESTS PASSED ----");
  $finish;
end

endmodule

