`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 08/04/2025 10:53:14 AM
// Design Name: 
// Module Name: barrel_shifter16
// Project Name: barrel_shifter16
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
    input wire [15:0] data_in,
    input wire [3:0] shamt,
    input wire dir,       // 0 = LEFT, 1 = RIGHT
    input wire rotate,    // 0 = LOGICAL, 1 = ROTATE
    output wire [15:0] data_out
);
    wire [15:0] stage[4:0];
    assign stage[0] = data_in;

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : stages
            wire [15:0] in = stage[i];
            wire [15:0] shifted;

            if (dir == 1'b0) begin
                // LEFT shift/rotate
                assign shifted = rotate ?
                    {in[15 - (1<<i):0], in[15:16 - (1<<i)]} :
                    {in[15 - (1<<i):0], {(1<<i){1'b0}}};
            end else begin
                // RIGHT shift/rotate
                assign shifted = rotate ?
                    {in[(1<<i)-1:0], in[15:(1<<i)]} :
                    {{(1<<i){1'b0}}, in[15:(1<<i)]};
            end

            assign stage[i+1] = shamt[i] ? shifted : in;
        end
    endgenerate

    assign data_out = stage[4];
endmodule
