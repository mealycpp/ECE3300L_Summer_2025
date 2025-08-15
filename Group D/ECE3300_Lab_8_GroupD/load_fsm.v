// load_fsm.v
`timescale 1ns/1ps
module load_fsm(
  input  wire clk,
  input  wire rst_n,
  input  wire load_pulse,
  output reg  [1:0] slot,
  output wire [3:0] slot_onehot,
  output reg  wr_res, wr_r, wr_g, wr_b
);
  assign slot_onehot = 4'b0001 << slot;

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) slot <= 2'd0;
    else if (load_pulse) slot <= slot + 2'd1;
  end

  always @* begin
    wr_res = 0; wr_r = 0; wr_g = 0; wr_b = 0;
    case (slot)
      2'd0: wr_res = load_pulse;
      2'd1: wr_r   = load_pulse;
      2'd2: wr_g   = load_pulse;
      2'd3: wr_b   = load_pulse;
    endcase
  end
endmodule
