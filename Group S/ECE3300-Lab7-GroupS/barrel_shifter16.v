`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 06:30:25 PM
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
    input  [15:0] data_in,
    input  [3:0]  shamt,
    input         dir,        // 0 = left, 1 = right
    input         rotate,     // 0 = logical, 1 = rotate
    output [15:0] data_out
);

    wire [15:0] stage1, stage2, stage3, stage4;

    // shift 1 bit
    assign stage1 = shamt[0] ? 
        (dir ? 
            (rotate ? {data_in[0], data_in[15:1]} : {1'b0, data_in[15:1]}) :
            (rotate ? {data_in[14:0], data_in[15]} : {data_in[14:0], 1'b0})
        ) : data_in;

   //shift 2 bits
    assign stage2 = shamt[1] ? 
        (dir ? 
            (rotate ? {stage1[1:0], stage1[15:2]} : {2'b00, stage1[15:2]}) :
            (rotate ? {stage1[13:0], stage1[15:14]} : {stage1[13:0], 2'b00})
        ) : stage1;

    //shift 4 bits
    assign stage3 = shamt[2] ? 
        (dir ? 
            (rotate ? {stage2[3:0], stage2[15:4]} : {4'b0000, stage2[15:4]}) :
            (rotate ? {stage2[11:0], stage2[15:12]} : {stage2[11:0], 4'b0000})
        ) : stage2;

   //shift 8 bits
    assign stage4 = shamt[3] ? 
        (dir ? 
            (rotate ? {stage3[7:0], stage3[15:8]} : {8'b00000000, stage3[15:8]}) :
            (rotate ? {stage3[7:0], stage3[15:8]} : {stage3[7:0], 8'b00000000})
        ) : stage3;

    assign data_out = stage4;

endmodule