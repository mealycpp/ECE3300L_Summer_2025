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
      in = 16'b1010_0101_1010_1100;
      for (sel = 0; sel < 16; sel = sel + 1) begin
          #10;
          $display("sel=%d, out=%b", sel, out);
        end
      $finish;
  end
endmodule
