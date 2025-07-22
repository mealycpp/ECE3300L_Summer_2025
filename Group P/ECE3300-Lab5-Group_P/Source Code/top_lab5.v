`timescale 1ns / 1ps                    // Sets simulation time unit to 1ns and precision to 1ps
module top_lab5 (
    input wire CLK,                     // System clock input
    input wire BTN0,                    // Reset button (active low)
    input wire BTN1,                    // Direction button: 1 = down, 0 = up
    input wire [4:0] SW,                // 5-bit switch input for speed control
    output wire [6:0] SEG,              // 7-segment display outputs (a-g)
    output wire [7:0] AN,               // Anode control for 8 digits; only 2 are used
    output wire [4:0] SWLED,            // LED outputs mirroring the switch values
    output wire [7:0] BCDLED            // LEDs to show BCD values (4 bits for tens + 4 for units)
);

wire [31:0] tick_counter;               // Output of the clock divider - slow counter
wire divided_clk;                       // Selected slowed-down clock signal
wire [3:0] unit_bcd, ten_bcd;           // 4-bit BCD values for units and tens digits
wire carry_from_unit;                   // Carry pulse from the unit digit counter
wire rst_n = BTN0;                      // Rename BTN0 to rst_n for clarity (active-low reset)
wire dir = BTN1;                        // Rename BTN1 to dir for counting direction

clock_divider clk_div_inst (
    .sys_clk(CLK),                      // Connect main clock input
    .reset_n(rst_n),                    // Connect reset signal
    .tick_count(tick_counter)           // Output: 32-bit slow counter ticks
);

mux32x1 mux_inst (
    .tick_bits(tick_counter),           // Input: all divided clock bits
    .speed_select(SW),                  // Select one bit using switch (SW) to control speed
    .clk_out(divided_clk)               // Output: selected divided clock signal
);

bcd_up_down_counter unit_counter (
    .clk_pulse(divided_clk),            // Use divided clock to increment/decrement
    .rst_n(rst_n),                      // Reset input
    .dir_up(dir),                       // Direction control (1 = down, 0 = up)
    .enable_count(1'b1),                // Always enabled (can add pause control here if desired)
    .bcd_value(unit_bcd),               // Output: BCD digit (0-9) for units place
    .carry_pulse(carry_from_unit)       // Output: triggers tens digit counter when rollover happens
);

bcd_up_down_counter ten_counter (
    .clk_pulse(divided_clk),            // Same divided clock
    .rst_n(rst_n),                      // Reset input
    .dir_up(dir),                       // Same direction input
    .enable_count(carry_from_unit),     // Count only when unit digit rolls over
    .bcd_value(ten_bcd),                // Output: BCD digit (0-9) for tens place
    .carry_pulse()                      // Carry out unused (no hundreds digit)
);

seg7_scan scan_driver (
    .clk_fast(CLK),                     // Use fast system clock for multiplexing
    .rst_n(rst_n),                      // Reset input
    .units_val(unit_bcd),               // Units digit to display
    .tens_val(ten_bcd),                 // Tens digit to display
    .seg_pins(SEG),                     // Output to 7-segment segments
    .dp(),                              // Decimal point not used
    .anodes(AN)                         // Anode control (which digit is on)
);

assign AN[7:2] = 6'b111111;             // Disable unused digits (only 2 active).
assign SWLED[4:0] = SW;                 // Mirror switch values to LEDs for visibility.
assign BCDLED[3:0] = unit_bcd;          // Show unit digit BCD value on LEDs 3-0.
assign BCDLED[7:4] = ten_bcd;           // Show tens digit BCD value on LEDs 7-4.


endmodule
