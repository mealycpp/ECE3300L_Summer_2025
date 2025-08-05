`timescale 1ns / 1ps

module debounce_toggle(
    input wire clk_1kHz,
    input wire btn_raw,
    output reg btn_toggle = 1'b0
);
    wire tick;
    debounce_tick dt_inst (
        .clk_1kHz(clk_1kHz),
        .btn_raw(btn_raw),
        .tick(tick)
    );

    always @(posedge clk_1kHz) begin
        if (tick) begin
            btn_toggle <= ~btn_toggle;
        end
    end
endmodule

module debounce_tick(
    input wire clk_1kHz,
    input wire btn_raw,
    output reg tick = 1'b0
);
    reg [2:0] shift_reg = 3'b000;
    reg debounced_state = 1'b0;
    reg prev_debounced_state = 1'b0;

    always @(posedge clk_1kHz) begin
        shift_reg <= {shift_reg[1:0], btn_raw};

        if (shift_reg == 3'b111) begin
            debounced_state <= 1'b1;
        end else if (shift_reg == 3'b000) begin
            debounced_state <= 1'b0;
        end

        prev_debounced_state <= debounced_state;

        tick <= (debounced_state == 1'b1 && prev_debounced_state == 1'b0);
    end
endmodule
