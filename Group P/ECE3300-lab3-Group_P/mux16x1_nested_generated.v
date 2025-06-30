module mux16x1_nested_generated(
    input wire [15:0] inputSwitchesAll,
    input wire [3:0] selectorBitsFromButtons,
    output wire finalMuxOutput
);

    wire [7:0] midStage1;
    wire [3:0] midStage2;
    wire [1:0] midStage3;

    genvar index;

    generate
        for (index = 0; index < 8; index = index + 1)
            mux2x1_gatesMessy m_stage1 (
                .inputWireA(inputSwitchesAll[2*index]),
                .inputWireB(inputSwitchesAll[2*index+1]),
                .selectorSignal(selectorBitsFromButtons[0]),
                .selectedOutput(midStage1[index])
            );

        for (index = 0; index < 4; index = index + 1)
            mux2x1_gatesMessy m_stage2 (
                .inputWireA(midStage1[2*index]),
                .inputWireB(midStage1[2*index+1]),
                .selectorSignal(selectorBitsFromButtons[1]),
                .selectedOutput(midStage2[index])
            );

        for (index = 0; index < 2; index = index + 1)
            mux2x1_gatesMessy m_stage3 (
                .inputWireA(midStage2[2*index]),
                .inputWireB(midStage2[2*index+1]),
                .selectorSignal(selectorBitsFromButtons[2]),
                .selectedOutput(midStage3[index])
            );

        mux2x1_gatesMessy m_finalStage (
            .inputWireA(midStage3[0]),
            .inputWireB(midStage3[1]),
            .selectorSignal(selectorBitsFromButtons[3]),
            .selectedOutput(finalMuxOutput)
        );
    endgenerate

endmodule
