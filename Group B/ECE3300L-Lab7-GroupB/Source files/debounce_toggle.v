module debounce_toggle(
    input wire clk_1kHz,
    input wire btn_raw,
    output reg btn_toggle = 0
);
    reg [2:0] sync = 3'b000;
    reg prev = 0;

    always @(posedge clk_1kHz) begin
        sync <= {sync[1:0], btn_raw};
        if (sync[2] & ~prev)
            btn_toggle <= ~btn_toggle;
        prev <= sync[2];
    end
endmodule