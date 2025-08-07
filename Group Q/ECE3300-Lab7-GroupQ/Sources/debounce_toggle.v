module debounce_toggle(
    input clk,       // ~1kHz
    input btn_raw,
    output reg btn_toggle = 0
);
    reg [2:0] shift = 3'b000;
    reg state = 0;
    always @(posedge clk) begin
        shift <= {shift[1:0], btn_raw};
        if (&shift) begin
            if (!state) begin
                btn_toggle <= ~btn_toggle;
                state <= 1;
            end
        end else if (~|shift) begin
            state <= 0;
        end
    end
endmodule