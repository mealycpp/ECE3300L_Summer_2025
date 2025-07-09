`timescale 1ns / 1ps

module top_tb;

  reg clk = 0;
  reg rst_n = 0;
  reg [15:0] sw;
  wire [15:0] LED;
  wire [6:0] Cnode;
  wire dp;
  wire [7:0] AN;

  // Instantiate DUT
  top uut (
    .clk(clk),
    .rst_n(rst_n),
    .sw(sw),
    .led(led),
    .Cnode(Cnode),
    .dp(dp),
    .AN(AN)
  );

  // Clock generator: 10ns period → 100 MHz
  always #5 clk = ~clk;

  initial begin
    rst_n = 0; sw = 16'h0000;
    #2;
    rst_n = 1;

    // Test different inputs
    sw = 16'h1234;
    #1; // Wait and observe waveforms

    sw = 16'hABCD;
    #1;
    
    sw = 16'h9859;
    #1;
    
    sw = 4'b0110;
    #1   
    sw = 4'b00111;
    #1;
    
    sw = 4'b1111;
    #1;
    
    sw = 4'b0010;
    #1;

    $stop;
  end

endmodule
