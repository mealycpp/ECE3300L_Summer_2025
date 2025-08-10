`timescale 1ns/1ps
module clock_divider_fixed #(
    parameter integer INPUT_HZ   = 100_000_000,
    parameter integer TICK1_HZ   = 1_000,
    parameter integer PWM_HZ     = 20_000
)(
    input  wire clk_in,
    input  wire rst, // Changed to active-high
    output reg  clk_1k = 1'b0,
    output reg  clk_pwm = 1'b0
);

    // Calculate the count value for a 50% duty cycle clock
    localparam integer DIV1H = (INPUT_HZ / TICK1_HZ) / 2;
    localparam integer DIVPMH = (INPUT_HZ / PWM_HZ) / 2;

    reg [$clog2(DIV1H)-1:0]  c1;
    reg [$clog2(DIVPMH)-1:0] c2;

    // Process for 1kHz clock
    always @(posedge clk_in or posedge rst) begin
        if (rst) begin
            c1 <= 0;
            clk_1k <= 1'b0;
        end else begin
            if (c1 == DIV1H - 1) begin
                c1 <= 0;
                clk_1k <= ~clk_1k;
            end else begin
                c1 <= c1 + 1;
            end
        end
    end
    
    // Process for PWM clock
    always @(posedge clk_in or posedge rst) begin
        if (rst) begin
            c2 <= 0;
            clk_pwm <= 1'b0;
        end else begin
            if (c2 == DIVPMH - 1) begin
                c2 <= 0;
                clk_pwm <= ~clk_pwm;
            end else begin
                c2 <= c2 + 1;
            end
        end
    end

endmodule