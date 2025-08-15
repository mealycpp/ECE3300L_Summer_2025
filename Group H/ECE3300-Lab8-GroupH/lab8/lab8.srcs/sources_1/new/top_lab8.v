`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE (Revised by Gemini)
// 
// Create Date: 08/10/2025
// Module Name: top_lab8
// Project Name: RGB LED PWM Controller
// Description: 
//   Top-level module for Lab 8. Integrates a clock divider, button debouncer,
//   FSM for loading PWM values, and the PWM core to control the two RGB LEDs
//   on the Nexys A7 board.
//////////////////////////////////////////////////////////////////////////////////

module top_lab8(
    input  wire        CLK100MHZ, // System clock
    input  wire        BTNC,      // Used as active-high reset
    input  wire        BTNR,      // "Load" button
    input  wire [7:0]  SW,        // 8-bit value for resolution/duty cycle
    output wire [3:0]  LED,       // Displays the current loading slot
    output wire        RGB1_R,    // RGB LED 1 (LD16)
    output wire        RGB1_G,
    output wire        RGB1_B,
    output wire        RGB2_R,    // RGB LED 2 (LD17)
    output wire        RGB2_G,
    output wire        RGB2_B
    );

    // Active-high reset for consistency
    wire rst = BTNC;

    //== 1. Clock Generation ==//
    wire clk_1k;
    wire clk_pwm;
    clock_divider_fixed #(.INPUT_HZ(100_000_000)) u_div(
        .clk_in(CLK100MHZ), 
        .rst(rst), 
        .clk_1k(clk_1k), 
        .clk_pwm(clk_pwm)
    );

    //== 2. Debouncer ==//
    wire load_pulse;
    debounce_onepulse #(.STABLE_TICKS(20)) u_db(
        .clk(clk_1k), 
        .rst(rst), 
        .din(BTNR), 
        .pulse(load_pulse)
    );

    //== 3. Load FSM ==//
    wire [3:0] slot_onehot;
    wire       wr_res, wr_r, wr_g, wr_b;
    load_fsm u_fsm(
        .clk(clk_1k), 
        .rst(rst), 
        .load_pulse(load_pulse),
        .slot_onehot(slot_onehot),
        .wr_res(wr_res), 
        .wr_r(wr_r), 
        .wr_g(wr_g), 
        .wr_b(wr_b)
    );

    // Display the current FSM state on the 4 right-most LEDs
    assign LED = slot_onehot;

    //== 4. PWM Value Registers ==//
    reg [7:0] reg_res, reg_r, reg_g, reg_b;
    always @(posedge clk_1k or posedge rst) begin
        if (rst) begin
            reg_res <= 8'd63; // Default resolution
            reg_r   <= 8'd0;
            reg_g   <= 8'd0;
            reg_b   <= 8'd0;
        end else begin
            if (wr_res) reg_res <= SW;
            if (wr_r)   reg_r   <= SW;
            if (wr_g)   reg_g   <= SW;
            if (wr_b)   reg_b   <= SW;
        end
    end

    //== 5. Clock Domain Crossing (CDC) Synchronizers ==//
    // Safely pass the register values from the 1kHz clock domain to the PWM clock domain.
    reg [7:0] res_q1, res_q2, r_q1, r_q2, g_q1, g_q2, b_q1, b_q2;
    always @(posedge clk_pwm or posedge rst) begin
        if (rst) begin
            {res_q1, res_q2} <= 0;
            {r_q1,   r_q2}   <= 0;
            {g_q1,   g_q2}   <= 0;
            {b_q1,   b_q2}   <= 0;
        end else begin
            res_q1 <= reg_res; res_q2 <= res_q1;
            r_q1   <= reg_r;   r_q2   <= r_q1;
            g_q1   <= reg_g;   g_q2   <= g_q1;
            b_q1   <= reg_b;   b_q2   <= b_q1;
        end
    end

    //== 6. PWM Core ==//
    wire pwm_r, pwm_g, pwm_b;
    pwm_core u_pwm(
        .clk(clk_pwm), 
        .rst(rst),
        .period(res_q2), 
        .duty_r(r_q2), 
        .duty_g(g_q2), 
        .duty_b(b_q2),
        .pwm_r(pwm_r), 
        .pwm_g(pwm_g), 
        .pwm_b(pwm_b)
    );

    //== 7. RGB LED Driver ==//
    // Drive both RGB LEDs with the same PWM signals.
    rgb_led_driver #(.ACTIVE_LOW(1)) u_led1(
        .pwm_r(pwm_r), .pwm_g(pwm_g), .pwm_b(pwm_b),
        .led_r(RGB1_R), .led_g(RGB1_G), .led_b(RGB1_B)
    );
    
    rgb_led_driver #(.ACTIVE_LOW(1)) u_led2(
        .pwm_r(pwm_r), .pwm_g(pwm_g), .pwm_b(pwm_b),
        .led_r(RGB2_R), .led_g(RGB2_G), .led_b(RGB2_B)
    );

endmodule
