module debounce_toggle (
    input wire clk,
    input wire btn_raw,     // Raw button input
    output reg btn_toggle        // Toggled output state
);

    wire btn_clean;
    reg btn_prev;

    // Debounce module (assumed to be defined elsewhere)
    debounce db (
        .clk(clk),
        .btn_in(btn_raw),
        .btn_clean(btn_clean)
    );

    always @(posedge clk ) begin

            if (btn_clean && !btn_prev)
                btn_toggle <= ~btn_toggle; // Toggle on rising edge
            btn_prev <= btn_clean;
        end

endmodule
