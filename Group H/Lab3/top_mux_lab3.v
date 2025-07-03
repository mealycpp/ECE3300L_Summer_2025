module top_mux_lab3 (
  input clk,
  input rst,               // Active-low CPU Reset button from Nexys A7
  input [15:0] SW,
  input btnU, btnD, btnL, btnR,
  output LED0
);

  wire [3:0] sel;

  // Invert the active-low reset signal from the board to active-high for logic
  wire rst_active;
  assign rst_active = ~rst;

  // Toggle each selector bit with debounced buttons
    toggle_switch t0 (.clk(clk), .rst(rst_active), .btn_raw(btnD), .state(sel[0]));
    toggle_switch t1 (.clk(clk), .rst(rst_active), .btn_raw(btnR), .state(sel[1]));
    toggle_switch t2 (.clk(clk), .rst(rst_active), .btn_raw(btnL), .state(sel[2]));
    toggle_switch t3 (.clk(clk), .rst(rst_active), .btn_raw(btnU), .state(sel[3]));
    
  // 16x1 MUX
  mux16x1 mux (.in(SW), .sel(sel), .out(LED0));

endmodule
