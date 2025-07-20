`timescale 1ns / 1ps

module mux32x1_tb;

  reg [31:0] cnt;
  reg [4:0] sel;
  wire clk_out;

  // Instantiate DUT
  mux32x1 uut (
    .cnt(cnt),
    .sel(sel),
    .clk_out(clk_out)
  );

  initial begin
    $display("Starting mux32x1_tb...");
    // Initialize counter with a known pattern
    cnt = 32'b10101010101010101010101010101010;

    // Test every bit position
    for (sel = 0; sel < 32; sel = sel + 1) begin
      #10;
      $display("sel = %d, clk_out = %b (should be cnt[%0d] = %b)", sel, clk_out, sel, cnt[sel]);
    end

    $stop;
  end

endmodule
