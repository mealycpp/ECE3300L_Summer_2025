`timescale 1ns/1ps
module pwm_core(
    input  wire       clk,
    input  wire       rst,           // active-high reset
    input  wire [7:0] period,        // RES register (0..255) -> eff_period = RES + 1 (1..256)
    input  wire [7:0] duty_r,
    input  wire [7:0] duty_g,
    input  wire [7:0] duty_b,
    output reg        pwm_r,
    output reg        pwm_g,
    output reg        pwm_b
);

    // Effective period is RES + 1 (as in the lab write-up)
    wire [8:0] eff_period = {1'b0, period} + 9'd1;

    // Clamp duty to [0, eff_period-1]
    function [8:0] clamp9(input [7:0] d);
        begin
            clamp9 = ({1'b0, d} >= eff_period) ? (eff_period - 9'd1) : {1'b0, d};
        end
    endfunction

    reg [8:0] cnt;

    // Count 0..eff_period-1
    always @(posedge clk or posedge rst) begin
        if (rst)
            cnt <= 9'd0;
        else if (cnt == eff_period - 1)
            cnt <= 9'd0;
        else
            cnt <= cnt + 9'd1;
    end

    // PWM compare
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pwm_r <= 1'b0;
            pwm_g <= 1'b0;
            pwm_b <= 1'b0;
        end else begin
            pwm_r <= (cnt < clamp9(duty_r));
            pwm_g <= (cnt < clamp9(duty_g));
            pwm_b <= (cnt < clamp9(duty_b));
        end
    end

endmodule
