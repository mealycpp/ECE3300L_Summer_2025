// pwm_core.v
`timescale 1ns/1ps
module pwm_core(
  input  wire       clk,
  input  wire       rst_n,
  input  wire [7:0] period,
  input  wire [7:0] duty_r, duty_g, duty_b,
  output reg        pwm_r, pwm_g, pwm_b
);
  // Effective period is (period + 1) to cover 0..period
  wire [8:0] eff_period = {1'b0, period} + 9'd1;

  // Clamp duty to <= eff_period-1
  function [8:0] clamp9(input [7:0] d);
    begin
      clamp9 = ({1'b0, d} >= eff_period) ? (eff_period - 9'd1) : {1'b0, d};
    end
  endfunction

  reg [8:0] cnt;

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n)                   cnt <= 0;
    else if (cnt == eff_period-1) cnt <= 0;
    else                          cnt <= cnt + 1;
  end

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) {pwm_r, pwm_g, pwm_b} <= 3'b000;
    else begin
      pwm_r <= (cnt < clamp9(duty_r));
      pwm_g <= (cnt < clamp9(duty_g));
      pwm_b <= (cnt < clamp9(duty_b));
    end
  end
endmodule
