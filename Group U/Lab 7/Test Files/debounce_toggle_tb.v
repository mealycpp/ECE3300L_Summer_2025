`timescale 1ns / 1ps

module debounce_toggle_tb;

    reg clk_1kHz = 0;
    reg btn_raw = 0;
    wire btn_toggle;

    debounce_toggle uut (
        .clk_1kHz(clk_1kHz),
        .btn_raw(btn_raw),
        .btn_toggle(btn_toggle)
    );

    always #500 clk_1kHz = ~clk_1kHz;  // 1 kHz clock (1ms period)

    initial begin
        $dumpfile("debounce_toggle_tb.vcd");
        $dumpvars(0, debounce_toggle_tb);

        // Initial stable low
        #5_000;

        // Glitchy press
        repeat (5) begin
            btn_raw = ~btn_raw;
            #300;
        end

        // Stable press
        btn_raw = 1; #5_000;

        // Glitchy release
        repeat (5) begin
            btn_raw = ~btn_raw;
            #300;
        end

        // Stable release
        btn_raw = 0; #5_000;

        $finish;
    end

endmodule
