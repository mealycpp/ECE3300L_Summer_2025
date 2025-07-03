`timescale 1ns / 1ps

module tb_mux16x1;

  // Inputs
  reg [15:0] in;
  reg [3:0] sel;

  // Output
  wire out;

  // Instantiate the Unit Under Test (UUT)
  mux16x1 uut (
    .in(in),
    .sel(sel),
    .out(out)
  );

  integer i;

  initial begin
    // Set a fixed test pattern
    in = 16'b1010110000110101;
    $display("Input: %b", in);
    $display("sel\t in[sel]\t out");

    // Test all selection values
    for (i = 0; i < 16; i = i + 1) begin
      sel = i;
      #10;
      if (out == 1'b1) begin
        $display("%2d\t    %b\t\t %b <-- PASS", sel, in[sel], out);
      end
    end

    $display("Test complete.");
  end

endmodule
