`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 03:49:28 PM
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
    input [15:0] data_in,
    input [3:0] shamt,
    input dir,        // 0 = left, 1 = right
    input rotate,     // 0 = logical, 1 = rotate
    output [15:0] data_out
);

    wire [15:0] stage [4:0];
    assign stage[0] = data_in;

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : shift_stages
            localparam SHIFT_AMOUNT = 1 << i;
            wire [15:0] in = stage[i];
            wire [15:0] out;
    
            assign out = (shamt[i]) ?
                         ( (dir == 0) ? // Left Shift/Rotate
                           ( (rotate) ? {in[15 - SHIFT_AMOUNT:0], in[15:16 - SHIFT_AMOUNT]} :
                                        {in[15 - SHIFT_AMOUNT:0], {SHIFT_AMOUNT{1'b0}}} ) :
                           ( (rotate) ? {in[SHIFT_AMOUNT - 1:0], in[15:SHIFT_AMOUNT]} :
                                        {{SHIFT_AMOUNT{1'b0}}, in[15:SHIFT_AMOUNT]} )
                         ) :
                         in;
    
            assign stage[i+1] = out;
        end
    endgenerate

    assign data_out = stage[4];
endmodule
