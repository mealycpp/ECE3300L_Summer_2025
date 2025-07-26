`timescale 1ns / 1ps

module clock_divider_tb();

// ----------------------------
// Signal Declarations
// ----------------------------
reg clk_tb;               // Testbench clock signal
reg rst_n;                // Active-low reset signal
wire [31:0] counter_tb;   // Output from DUT (Device Under Test)

// ----------------------------
// Clock Generation
// ----------------------------
initial clk_tb = 0;
always #1 clk_tb = ~clk_tb;  // Toggle clock every 1 ns → 500 MHz clock

// ----------------------------
// Stimulus Block
// ----------------------------
initial begin
    rst_n = 0;           // Hold reset low
    #10;
    rst_n = 1;           // Release reset after 10 ns
    #1000000000;         // Let simulation run for a long time (1 sec sim time)
    $finish;             // Stop simulation
end

// ----------------------------
// DUT Instantiation
// ----------------------------
clock_divider clock_divider_tb1 (
    .CLK(clk_tb),         // Connect testbench clock to DUT
    .rst_n(rst_n),        // Connect reset
    .counter(counter_tb)  // Connect counter output
);

endmodule
