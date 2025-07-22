`timescale 1ns/1ps
module tb_mux32x1;
  reg  [31:0] count;
  reg  [4:0]  sel;
  wire        clk_out;

  // Unit under test
  mux32x1 uut (
    .count   (count),
    .sel     (sel),
    .clk_out (clk_out)
  );

  initial begin
    // pick a pattern for count
    count = 32'h1234_5678;
    // sweep through all select values
    for (sel = 0; sel < 32; sel = sel + 1) begin
      #10;
      $display("sel=%0d => clk_out = count[%0d] = %b", sel, sel, clk_out);
    end
    $finish;
  end
endmodule