`timescale 1ns / 1ps

module shamt_counter (
    input wire clk,            // 1 kHz clock
    input wire btn_raw,        // Raw BTNC input
    output reg [1:0] shamt     // One-cycle pulse for SHAMT increment
);
    reg shamt_pulse;
    wire btn_clean;
    reg btn_prev;

    // Debounce the raw button
    debounce db (
        .clk(clk),
        .btn_in(btn_raw),
        .btn_clean(btn_clean)
    );

    // One-cycle pulse on rising edge of debounced button
    always @(posedge clk) begin
        btn_prev <= btn_clean;
        shamt_pulse <= btn_clean & ~btn_prev;
        
        if (shamt_pulse) begin
            shamt <= shamt + 1;
        end
    end
    
endmodule
