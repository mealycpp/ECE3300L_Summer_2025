module toggleButtonSelector(
    input wire clockLineFromBoard,
    input wire resetWholeSystem,
    input wire bouncingButtonSignal,
    output reg toggledStateOut
);

    wire cleanButtonOutput;
    reg lastButtonMemory;

    buttonDebouncer debInst (
        .systemClock(clockLineFromBoard),
        .buttonInputRaw(bouncingButtonSignal),
        .stableButtonOutput(cleanButtonOutput)
    );

    always @(posedge clockLineFromBoard) begin
        if (resetWholeSystem) begin
            toggledStateOut <= 0;
            lastButtonMemory <= 0;
        end else begin
            if (cleanButtonOutput && !lastButtonMemory)
                toggledStateOut <= ~toggledStateOut;

            lastButtonMemory <= cleanButtonOutput;
        end
    end
endmodule
