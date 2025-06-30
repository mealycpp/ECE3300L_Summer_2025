module buttonDebouncer(
    input wire systemClock,
    input wire buttonInputRaw,
    output reg stableButtonOutput
);

    reg [2:0] debounceShiftRegister;

    always @(posedge systemClock) begin
        debounceShiftRegister <= {debounceShiftRegister[1:0], buttonInputRaw};

        if (debounceShiftRegister == 3'b111)
            stableButtonOutput <= 1;
        else if (debounceShiftRegister == 3'b000)
            stableButtonOutput <= 0;
    end
endmodule
