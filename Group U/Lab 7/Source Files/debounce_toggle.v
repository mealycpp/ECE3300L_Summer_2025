`timescale 1ns / 1ps

module debounce_toggle(
    input wire clk_1kHz,     // ~1kHz clock input
    input wire btn_raw,      // raw button signal (from BTN)
    output reg btn_toggle    // toggled output (1 or 0)
);

    reg [2:0] shift_reg = 3'b000;
    reg last_clean = 0;

    always @(posedge clk_1kHz) begin
        // Shift in the new button state
        shift_reg <= {shift_reg[1:0], btn_raw};

        // Check for stable value (debounced)
        if (shift_reg == 3'b111 && last_clean == 0) begin
            btn_toggle <= ~btn_toggle;
            last_clean <= 1;
        end else if (shift_reg == 3'b000) begin
            last_clean <= 0;
        end
    end

endmodule
