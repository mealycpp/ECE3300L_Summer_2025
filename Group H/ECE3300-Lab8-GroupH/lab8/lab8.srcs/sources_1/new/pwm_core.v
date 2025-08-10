`timescale 1ns/1ps
module pwm_core(
    input  wire       clk,
    input  wire       rst, // Changed to active-high
    input  wire [7:0] period, // PWM resolution
    input  wire [7:0] duty_r, 
    input  wire [7:0] duty_g, 
    input  wire [7:0] duty_b,
    output reg        pwm_r, 
    output reg        pwm_g, 
    output reg        pwm_b
);

    reg [8:0] cnt;

    // The counter runs from 0 to 'period'
    always @(posedge clk or posedge rst) begin
        if (rst)
            cnt <= 0;
        else if (cnt == period) // Use 'period' directly as the max value
            cnt <= 0;
        else
            cnt <= cnt + 1;
    end

    // Compare the counter to the duty cycle to generate the PWM signal
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pwm_r <= 1'b0;
            pwm_g <= 1'b0;
            pwm_b <= 1'b0;
        end else begin
            // The output is high as long as the counter is less than the duty cycle
            pwm_r <= (cnt < duty_r);
            pwm_g <= (cnt < duty_g);
            pwm_b <= (cnt < duty_b);
        end
    end

endmodule

