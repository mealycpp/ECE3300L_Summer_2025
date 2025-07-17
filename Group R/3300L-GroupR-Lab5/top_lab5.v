`timescale 1ns / 1ps
module top_lab5(
    input wire CLK,
    input wire [4:0] SW,
    input wire BTN1,
    input wire BTN0,
    output wire [7:0] AN,
    output wire [6:0] SEG,
    output wire [12:0] LED
);
  wire rst_n = BTN0;
  wire [4:0] sel_inv = 5'd31 - SW;
  wire [31:0] count;
  clock_divider u_div(
    .CLK(CLK),
    .rst_n(rst_n),
    .counter(count)
  );
  wire clk_div;
  mux32x1 u_mux(
    .Sel(sel_inv),
    .cnt(count),
    .clk_out(clk_div)
  );
  reg div_prev;
  always @(posedge CLK) div_prev <= rst_n ? clk_div : 1'b0;
  wire tick = clk_div & ~div_prev;
  reg btn1_prev;
  always @(posedge CLK) btn1_prev <= rst_n ? BTN1 : 1'b0;
  wire btn1_edge = BTN1 & ~btn1_prev;
  reg direction;
  always @(posedge CLK) begin
    if (!rst_n) direction <= 1'b1;
    else if (btn1_edge) direction <= ~direction;
  end
  wire [3:0] units, tens;
  wire unit_roll;
  bcd_digit_counter u0(
    .clk(CLK),
    .enable(tick),
    .dir(direction),
    .rst_n(rst_n),
    .digit(units),
    .rollover(unit_roll)
  );
  bcd_digit_counter u1(
    .clk(CLK),
    .enable(unit_roll),
    .dir(direction),
    .rst_n(rst_n),
    .digit(tens),
    .rollover()
  );
  wire [7:0] out_bcd = {tens, units};
  wire [1:0] an_active;
  seg7_scan u_seg(
    .AN(an_active),
    .SEG(SEG),
    .out(out_bcd),
    .CLK(CLK),
    .rst_n(rst_n)
  );
  assign AN = {6'b111111, an_active};
  assign LED[4:0] = SW;
  assign LED[8:5] = units;
  assign LED[12:9] = tens;
endmodule
