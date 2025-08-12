`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/10/2025 08:26:42 PM
// Design Name: 
// Module Name: top_lab8
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_lab8(
    input  wire        clk100mhz,
    input  wire        btnc,       // Center button (active-high on board)
    input  wire        btnr,       // Right button -> LOAD
    input  wire [7:0]  sw,
    output wire [3:0]  led,        // slot indicator (one-hot)
    output wire        rgb_r, rgb_g, rgb_b
);
    // Convert active-high BTNC to active-low reset_n used across design
    wire rst_n = ~btnc;  // hold BTNC to reset; release to run

    // Clocks
    wire clk_1k, clk_pwm;
    clock_divider_fixed u_div(
        .clk_in(clk100mhz), .rst_n(rst_n), .clk_1k(clk_1k), .clk_pwm(clk_pwm)
    );

    // Debounce + one-pulse for LOAD (use 1kHz domain)
    wire load_pulse;
    debounce_onepulse #(.STABLE_TICKS(20)) u_db(
        .clk(clk_1k), .rst_n(rst_n), .din(btnr), .pulse(load_pulse)
    );

    // Slot FSM
    wire [1:0] slot;
    wire [3:0] slot_oh;
    wire wr_res, wr_r, wr_g, wr_b;
    load_fsm u_fsm(
        .clk(clk_1k), .rst_n(rst_n), .load_pulse(load_pulse),
        .slot(slot), .slot_onehot(slot_oh),
        .wr_res(wr_res), .wr_r(wr_r), .wr_g(wr_g), .wr_b(wr_b)
    );
    assign led = slot_oh;

    // Registers written in 1k domain
    reg [7:0] reg_res, reg_r, reg_g, reg_b;
    always @(posedge clk_1k or negedge rst_n) begin
        if (!rst_n) begin
            reg_res <= 8'd63; // default period ~64 for safe start
            reg_r   <= 8'd0;
            reg_g   <= 8'd0;
            reg_b   <= 8'd0;
        end else begin
            if (wr_res) reg_res <= sw;
            if (wr_r)   reg_r   <= sw;
            if (wr_g)   reg_g   <= sw;
            if (wr_b)   reg_b   <= sw;
        end
    end

    // Cross to PWM domain (2FF synchronizers per byte)
    reg [7:0] res_q1,res_q2,r_q1,r_q2,g_q1,g_q2,b_q1,b_q2;
    always @(posedge clk_pwm or negedge rst_n) begin
        if (!rst_n) begin
            res_q1<=0; res_q2<=0;
            r_q1<=0;   r_q2<=0;
            g_q1<=0;   g_q2<=0;
            b_q1<=0;   b_q2<=0;
        end else begin
            res_q1<=reg_res; res_q2<=res_q1;
            r_q1  <=reg_r;   r_q2  <=r_q1;
            g_q1  <=reg_g;   g_q2  <=g_q1;
            b_q1  <=reg_b;   b_q2  <=b_q1;
        end
    end

    // PWM core @ clk_pwm
    wire pwm_r, pwm_g, pwm_b;
    pwm_core u_pwm(
        .clk(clk_pwm), .rst_n(rst_n),
        .period(res_q2), .duty_r(r_q2), .duty_g(g_q2), .duty_b(b_q2),
        .pwm_r(pwm_r), .pwm_g(pwm_g), .pwm_b(pwm_b)
    );

    // Drive the RGB LED (active-low)
    rgb_led_driver #(.ACTIVE_LOW(1)) u_led(
        .pwm_r(pwm_r), .pwm_g(pwm_g), .pwm_b(pwm_b),
        .led_r(rgb_r), .led_g(rgb_g), .led_b(rgb_b)
    );
endmodule

