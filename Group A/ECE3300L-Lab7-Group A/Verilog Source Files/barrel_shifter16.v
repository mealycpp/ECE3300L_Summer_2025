`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2025 10:56:57 PM
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
    input rst_n,
    input dir,
    input rotate,
    output [15:0] data_out
    );
    
    wire [15:0] stage [0:4]; // stage[0] = input, stage[4] = final result
    assign stage[0] = data_in;

    genvar s, i;
    generate
        for (s = 0; s < 4; s = s + 1) begin : shift_stages
            localparam integer shift_val = (1 << s);
            for (i = 0; i < 16; i = i + 1) begin : mux_per_bit
                wire [15:0] curr = stage[s];

                // Compute the shifted index depending on direction
                wire [4:0] left_idx  = (i >= shift_val) ? (i - shift_val) : (16 + i - shift_val);
                wire [4:0] right_idx = (i + shift_val) % 16;

                wire       use_left  = ~dir;
                wire [4:0] shift_idx = use_left ? left_idx : right_idx;

                wire       out_of_bounds = (use_left && i < shift_val) || (dir && (i + shift_val >= 16));
                wire       bit_val = rotate ? curr[shift_idx] :
                                      (out_of_bounds ? 1'b0 : curr[shift_idx]);

                assign stage[s+1][i] = shamt[s] ? bit_val : curr[i];
            end
        end
    endgenerate

    assign data_out = stage[4];
    
endmodule
