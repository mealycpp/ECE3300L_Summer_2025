`timescale 1ns / 1ps
module bcd_counter_tb;
// -----------------------------
// Testbench signal declarations
// -----------------------------
reg clk;               // Clock signal
reg rst_n;             // Active-low reset
reg up_down;           // Direction control: 1 = count up, 0 = count down
wire [3:0] place1;      // Ones digit output from counter
wire [3:0] place10;     // Tens digit output from counter
wire rollover_tb;       // Signal from ones place indicating rollover to tens
// -----------------------------
// Clock generation: 10 ns period (100 MHz)
// -----------------------------
initial clk = 0;
always #5 clk = ~clk;  // Toggle clock every 5 ns
// -----------------------------
// Stimulus block
// -----------------------------
initial begin
    rst_n = 0;          // Hold in reset initially
    up_down = 0;        // Direction doesn't matter during reset

    #30
    rst_n = 1;          // Release reset

    #10
    up_down = 1;        // Start counting up

    #200
    up_down = 0;        // Then count down

    #200
    $stop;              // End simulation
end
// -----------------------------
// Ones digit BCD counter
// Always enabled
// -----------------------------
bcd_digit_counter bcd_digit_counter_tb_1s (
    .clk(clk),
    .enable(1'b1),       // Always enabled
    .dir(up_down),       // Direction from testbench
    .rst_n(rst_n),       // Active-low reset
    .digit(place1),      // Output to ones place
    .rollover(rollover_tb) // Rollover signal to tens place
);
// -----------------------------
// Tens digit BCD counter
// Enabled only on rollover from ones digit
// -----------------------------
bcd_digit_counter bcd_digit_counter_tb_10s (
    .clk(clk),
    .enable(rollover_tb), // Enabled only when rollover from ones occurs
    .dir(up_down),        // Same direction
    .rst_n(rst_n),        // Same reset
    .digit(place10),      // Output to tens place
    .rollover()           // Rollover not used in this testbench
);
endmodule
