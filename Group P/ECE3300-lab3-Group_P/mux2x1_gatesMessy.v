module mux2x1_gatesMessy(
    input wire inputWireA,
    input wire inputWireB,
    input wire selectorSignal,
    output wire selectedOutput
);

    wire inverseOfSelector;
    wire wireAWhenSelectorLow;
    wire wireBWhenSelectorHigh;

    not(inverseOfSelector, selectorSignal);
    and(wireAWhenSelectorLow, inputWireA, inverseOfSelector);
    and(wireBWhenSelectorHigh, inputWireB, selectorSignal);
    or(selectedOutput, wireAWhenSelectorLow, wireBWhenSelectorHigh);

endmodule
