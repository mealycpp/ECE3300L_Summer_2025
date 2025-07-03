module debounce(
  input clk,
  input btn_in,
  output reg btn_clean
);
  reg [2:0] shift_reg;
  always @(posedge clk) begin
    shift_reg <= {shift_reg[1:0], btn_in};
    if (shift_reg == 3'b111)
      btn_clean <= 1;
    else if (shift_reg == 3'b000)
      btn_clean <= 0;
  end
endmodule
