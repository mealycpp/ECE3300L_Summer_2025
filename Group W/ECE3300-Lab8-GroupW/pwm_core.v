`timescale 1ns/1ps
module pwm_core (
    input wire clk,
    input wire rst_n,
    input wire [7:0] period,
    input wire [7:0] duty_r,
    input wire [7:0] duty_g,
    input wire [7:0] duty_b,
    output reg pwm_r,
    output reg pwm_g,
    output reg pwm_b
);

    localparam CNT_WIDTH = 9;
    wire [CNT_WIDTH-1:0] eff_period = {1'b0, period} + 9'd1;
    
    // Clamp function to prevent duty > period
    function [CNT_WIDTH-1:0] clamp9(input [7:0] d);
        begin
            clamp9 = ({1'b0, d} >= eff_period) ? (eff_period - 1) : {1'b0, d};
        end
    endfunction
    
    reg [CNT_WIDTH-1:0] cnt;
    
    // Counter logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            cnt <= 0;
        else if (cnt == eff_period - 1)
            cnt <= 0;
        else
            cnt <= cnt + 1;
    end
    
    // PWM output logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pwm_r <= 0;
            pwm_g <= 0;
            pwm_b <= 0;
        end else begin
            pwm_r <= (cnt < clamp9(duty_r));
            pwm_g <= (cnt < clamp9(duty_g));
            pwm_b <= (cnt < clamp9(duty_b));
        end
    end

endmodule
