`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2025 09:36:53 PM
// Design Name: 
// Module Name: barrel_shifter16
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module barrel_shifter16(
    input [15:0] DATA_IN,
    input [3:0] SHAMT,
    input DIR,         // 0 = left, 1 = right
    input ROTATE,      // 0 = logical, 1 = rotate
    output [15:0] DATA_OUT
);
    wire [15:0] stage1, stage2, stage3, stage4;

    assign stage1 = SHAMT[0] ?
        (DIR ?
            (ROTATE ? {DATA_IN[0], DATA_IN[15:1]} : {1'b0, DATA_IN[15:1]}) :
            (ROTATE ? {DATA_IN[14:0], DATA_IN[15]} : {DATA_IN[14:0], 1'b0})
        )
        : DATA_IN;

    assign stage2 = SHAMT[1] ?
        (DIR ?
            (ROTATE ? {stage1[1:0], stage1[15:2]} : {2'b00, stage1[15:2]}) :
            (ROTATE ? {stage1[13:0], stage1[15:14]} : {stage1[13:0], 2'b00})
        )
        : stage1;

    assign stage3 = SHAMT[2] ?
        (DIR ?
            (ROTATE ? {stage2[3:0], stage2[15:4]} : {4'b0000, stage2[15:4]}) :
            (ROTATE ? {stage2[11:0], stage2[15:12]} : {stage2[11:0], 4'b0000})
        )
        : stage2;

    assign stage4 = SHAMT[3] ?
        (DIR ?
            (ROTATE ? {stage3[7:0], stage3[15:8]} : {8'b00000000, stage3[15:8]}) :
            (ROTATE ? {stage3[7:0], stage3[15:8]} : {stage3[7:0], 8'b00000000})
        )
        : stage3;

    assign DATA_OUT = stage4;
endmodule

