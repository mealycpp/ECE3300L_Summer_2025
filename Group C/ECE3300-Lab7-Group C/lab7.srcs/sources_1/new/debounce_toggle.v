module debounce_toggle(
    input wire clk1k,
    input wire btn_raw,
    output reg btn_toggle = 1'b0
);
    wire tick;
    debounce_tick dt_inst (
        .clk1k(clk1k),
        .btn_raw(btn_raw),
        .tick(tick)
    );

    always @(posedge clk1k) begin
        if (tick) begin
            btn_toggle <= ~btn_toggle;
        end
    end
endmodule

module debounce_tick(
    input wire clk1k,
    input wire btn_raw,
    output reg tick = 1'b0
);
    reg [2:0] shift_reg = 3'b000;
    reg debounced_state = 1'b0;
    reg prev_debounced_state = 1'b0;

    always @(posedge clk1k) begin
        shift_reg <= {shift_reg[1:0], btn_raw};

        if (shift_reg == 3'b111) debounced_state <= 1'b1;
        else if (shift_reg == 3'b000) debounced_state <= 1'b0;

        prev_debounced_state <= debounced_state;

        tick <= (debounced_state == 1'b1 && prev_debounced_state == 1'b0);
    end
endmodule