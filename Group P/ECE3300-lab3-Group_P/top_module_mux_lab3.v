module top_module_mux_lab3(
    input wire clkFromBoard,
    input wire resetButtonActiveHigh,
    input wire [15:0] physicalSwitchInputs,
    input wire upBtn, downBtn, leftBtn, rightBtn,
    output wire singleLEDOutput
);

    wire [3:0] selectorLineForMUX;

    toggleButtonSelector selBit0 (
        .clockLineFromBoard(clkFromBoard),
        .resetWholeSystem(resetButtonActiveHigh),
        .bouncingButtonSignal(downBtn),
        .toggledStateOut(selectorLineForMUX[0])
    );

    toggleButtonSelector selBit1 (
        .clockLineFromBoard(clkFromBoard),
        .resetWholeSystem(resetButtonActiveHigh),
        .bouncingButtonSignal(rightBtn),
        .toggledStateOut(selectorLineForMUX[1])
    );

    toggleButtonSelector selBit2 (
        .clockLineFromBoard(clkFromBoard),
        .resetWholeSystem(resetButtonActiveHigh),
        .bouncingButtonSignal(leftBtn),
        .toggledStateOut(selectorLineForMUX[2])
    );

    toggleButtonSelector selBit3 (
        .clockLineFromBoard(clkFromBoard),
        .resetWholeSystem(resetButtonActiveHigh),
        .bouncingButtonSignal(upBtn),
        .toggledStateOut(selectorLineForMUX[3])
    );

    mux16x1_nested_generated dataMUX (
        .inputSwitchesAll(physicalSwitchInputs),
        .selectorBitsFromButtons(selectorLineForMUX),
        .finalMuxOutput(singleLEDOutput)
    );
endmodule
