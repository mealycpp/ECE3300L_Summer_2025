module toggle_switch (
    input wire clk,         
    input wire btn_raw,     // Raw button input
    output reg state        // Toggled output state
);

    wire btn_clean;
    reg btn_prev;

    // Debounce module 
    debounce db (
        .clk(clk),
        .btn_in(btn_raw),
        .btn_clean(btn_clean)
    );

    always @(posedge clk) begin
        
            if (btn_clean && !btn_prev)
                state <= ~state; // Toggle on rising edge
            btn_prev <= btn_clean;
        end

endmodule
