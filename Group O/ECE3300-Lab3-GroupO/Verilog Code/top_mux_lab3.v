module top_mux_lab3(
  input clk,
  input rst,
  input [15:0] SW,
  input btnU, btnD, btnL, btnR,
  output LED0
);
  wire [3:0] sel;
  toggle_switch t0 (.clk(clk), .rst(rst), .btn_raw(btnD), .state(sel[0]));
  toggle_switch t1 (.clk(clk), .rst(rst), .btn_raw(btnR), .state(sel[1]));
  toggle_switch t2 (.clk(clk), .rst(rst), .btn_raw(btnL), .state(sel[2]));
  toggle_switch t3 (.clk(clk), .rst(rst), .btn_raw(btnU), .state(sel[3]));
  mux16x1 mux (.in(SW), .sel(sel), .out(LED0));
endmodule