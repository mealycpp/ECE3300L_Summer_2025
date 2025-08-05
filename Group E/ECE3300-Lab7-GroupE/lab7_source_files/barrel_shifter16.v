`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 10:54:00 AM
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
    input  wire [15:0] data_in,
    input  wire [3:0]  shamt,     
    input  wire        dir,       
    input  wire        rotate,    
    output wire [15:0] data_out
);
    wire [15:0] stage1, stage2, stage3, stage4;

    // Stage shift amount = 1
    assign stage1 = shamt[0] ?
        (dir ?
            // right
            (rotate ? {data_in[0],      data_in[15:1]}  // ror 1
                    : {1'b0,            data_in[15:1]}) // >> 1 logical
          :
            // left
            (rotate ? {data_in[14:0],   data_in[15]}    // rol 1
                    : {data_in[14:0],   1'b0})          // << 1 logical
        )
        : data_in;

    // Stage shift amount = 2
    assign stage2 = shamt[1] ?
        (dir ?
            // right
            (rotate ? {stage1[1:0],     stage1[15:2]}   // ror 2
                    : {2'b00,           stage1[15:2]})  // >> 2 logical
          :
            // left
            (rotate ? {stage1[13:0],    stage1[15:14]}  // rol 2
                    : {stage1[13:0],    2'b00})         // << 2 logical
        )
        : stage1;

    // Stage shift amount = 4
    assign stage3 = shamt[2] ?
        (dir ?
            // right
            (rotate ? {stage2[3:0],     stage2[15:4]}   // ror 4
                    : {4'b0000,         stage2[15:4]})  // >> 4 logical
          :
            // left
            (rotate ? {stage2[11:0],    stage2[15:12]}  // rol 4
                    : {stage2[11:0],    4'b0000})       // << 4 logical
        )
        : stage2;

    // Stage shift amount = 8
    assign stage4 = shamt[3] ?
        (dir ?
            // right
            (rotate ? {stage3[7:0],     stage3[15:8]}   // ror 8
                    : {8'b0000_0000,    stage3[15:8]})  // >> 8 logical
          :
            // left
            (rotate ? {stage3[7:0],     stage3[15:8]}   // rol 8 (same wiring as ror 8 on 16-bit)
                    : {stage3[7:0],     8'b0000_0000})  // << 8 logical
        )
        : stage3;

    assign data_out = stage4;

endmodule
