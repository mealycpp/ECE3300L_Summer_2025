`timescale 1ns / 1ps
module top_lab5(
    input  wire       CLK,      // 100 MHz board clock
    input  wire [4:0] SW,       // speed-select index
    input  wire       BTN0,     // reset (active low)
    input  wire       BTN1,     // direction 
    output wire [7:0] AN,       // digit enable
    output wire [6:0] SEG,      // segment pins
    output wire [4:0] LED_SW,   // debug: SW[4:0]
    output wire [7:0] LED_BCD   // debug: {tens, units}
);

  
  wire rst_n = ~BTN0;
  wire [31:0] clk_count;
  wire clk_div;
  
  clock_divider u_clkdiv (
    .clk   (CLK),
    .rst_n (rst_n),      
    .count (clk_count)
  );
  mux32x1 u_mux (
    .count   (clk_count),
    .sel     (SW),
    .clk_out (clk_div)
  );

  // BCD up/down, driven by BTN1
  wire dir = ~BTN1;
  wire [3:0] units, tens;
  
  bcd_up_down_counter u_counter (
    .clk   (clk_div),
    .rst_n (rst_n),
    .dir   (dir),
    .digit0(units),
    .digit1(tens)
  );

  // 7-seg scanner
  seg7_scan u_scan (
    .clk    (CLK),
    .rst_n  (rst_n),
    .digit0 (units),
    .digit1 (tens),
    .an     (AN),
    .seg    (SEG)
  );

  // debug LEDs
  assign LED_SW  = SW[4:0];
  assign LED_BCD = {tens, units};

endmodule
