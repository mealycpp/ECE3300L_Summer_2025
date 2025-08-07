module debounce_toggle(
    input wire clk,                                     // Debounce sampling clock
    input wire btn_raw,                                 // button input
    output reg btn_toggle = 0                           // Output toggles on each rising edge
);
    reg [3:0] shift = 0;                                // 4-bit shift register for sampling button states
    reg state = 0;                                      // Internal state

    always @(posedge clk) begin
        shift <= {shift[2:0], btn_raw};                 // Shift in the latest button state
        if (shift == 4'b1111 && !state) begin
            state <= 1;                                 // Mark button as "pressed"
            btn_toggle <= ~btn_toggle;                  // Toggle the output
        end else if (shift == 4'b0000 && state) begin
            state <= 0;                                 // Mark button as "released"
        end
    end
endmodule