module top_mux_lab3 (
  input clk,
  input rst,               // Active-low CPU Reset button from Nexys A7
  input [15:0] SW,
  input btnU, btnD, btnL, btnR,
  output LED0,
  output LED1,
  output LED2,
  output LED3,
  output LED4
);

  wire cleanD, cleanR, cleanL, cleanU;
  wire [3:0] sel;

  // Invert the active-low reset signal from the board to active-high for logic
  wire rst_active;
  assign rst_active = ~rst;

  // Debounce each button
  debounce dbD (.clk(clk), .btn_in(btnD), .btn_clean(cleanD));
  debounce dbR (.clk(clk), .btn_in(btnR), .btn_clean(cleanR));
  debounce dbL (.clk(clk), .btn_in(btnL), .btn_clean(cleanL));
  debounce dbU (.clk(clk), .btn_in(btnU), .btn_clean(cleanU));

  // Toggle each selector bit with debounced buttons
  toggle_switch t0 (.clk(clk), .rst(rst_active), .btn_raw(cleanD), .state(sel[0]));
  toggle_switch t1 (.clk(clk), .rst(rst_active), .btn_raw(cleanR), .state(sel[1]));
  toggle_switch t2 (.clk(clk), .rst(rst_active), .btn_raw(cleanL), .state(sel[2]));
  toggle_switch t3 (.clk(clk), .rst(rst_active), .btn_raw(cleanU), .state(sel[3]));

  // 16x1 MUX
  mux16x1 mux (.in(SW), .sel(sel), .out(LED0));

  // Debugging: Show selector bits on LED1-LED4
  assign LED1 = sel[0];
  assign LED2 = sel[1];
  assign LED3 = sel[2];
  assign LED4 = sel[3];

endmodule
