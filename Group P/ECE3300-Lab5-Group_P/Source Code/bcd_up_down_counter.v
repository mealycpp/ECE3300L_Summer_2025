module bcd_up_down_counter (
    input wire clk_pulse,                           // Clock input signal for triggering the counter
    input wire rst_n,                               // Active-low reset signal
    input wire dir_up,                              // Direction control: 1 = count down, 0 = count up
    input wire enable_count,                        // Enable signal: when high, the counter operates
    output reg [3:0] bcd_value,                     // 4-bit BCD output value (0-9)
    output reg carry_pulse                          // Single-cycle pulse indicating a rollover (carry/borrow)
);

always @(posedge clk_pulse or negedge rst_n) begin  // Triggered on rising edge of clk_pulse or falling edge of rst_n (asynchronous reset)
    if (!rst_n) begin
        bcd_value <= 0;                             // Reset BCD value to 0
        carry_pulse <= 0;                           // Reset carry pulse to 0
    end else if (enable_count) begin
        carry_pulse <= 0;                           // Clear carry pulse at start of each counting cycle
        if (dir_up) begin                           // If dir_up is 1, count DOWN
            if (bcd_value == 1) begin
                bcd_value <= 0;                     // When at 1, decrement to 0 and issue carry_pulse
                carry_pulse <= 1;
            end else if (bcd_value == 0) begin
                bcd_value <= 9;                     // Underflow: wrap around to 9
            end else begin
                bcd_value <= bcd_value - 1;         // Regular decrement
            end
        end else begin                              // If dir_up is 0, count UP
            if (bcd_value == 8) begin
                bcd_value <= 9;                     // Set to 9, next cycle will wrap to 0
                carry_pulse <= 1;                   // Indicate carry/overflow pulse
            end else if (bcd_value == 9) begin
                bcd_value <= 0;                     // Overflow: wrap from 9 back to 0
            end else begin
                bcd_value <= bcd_value + 1;         // Regular increment
            end
        end
    end
end

endmodule
