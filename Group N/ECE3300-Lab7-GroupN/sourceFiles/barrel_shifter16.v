`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2025 06:48:27 PM
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
    input  wire [3:0]  shamt,    // shift amount (0-15)
    input  wire        dir,      // 0 = left shift, 1 = right shift
    input  wire        rotate,   // 0 = logical shift, 1 = rotate
    output [15:0] result_word
);
    wire [15:0] stage0, stage1, stage2, stage3;

    genvar i;

    // stage0: shift/rotate by 1 
    generate
        for (i = 0; i < 16; i = i + 1) begin 
            wire a, b_sel;
            wire b_rotate, b_shift;
            
            assign a = data_in[i];
            
            // logical shift left/right by 1 with zero padding
            wire b_shift_left  = (i >= 1)  ? data_in[i - 1] : 1'b0;
            wire b_shift_right = (i <= 14) ? data_in[i + 1] : 1'b0;
            assign b_shift = (dir == 1'b0) ? b_shift_left : b_shift_right;
            
            // b_rotate depending on rotate or logical shift
            // rotate left by 1: bit (i-1) mod 16; rotate right by 1: bit (i+1) mod 16
            assign b_rotate = (dir == 1'b0) ? data_in[(i + 15) % 16] : data_in[(i + 1) % 16];
            
            // select rotate or shift
            assign b_sel = (rotate == 1'b1) ? b_rotate : b_shift;

            mux_2x1 m0 (.a(a), .b(b_sel), .sel(shamt[0]), .y(stage0[i]));
        end
    endgenerate

    // stage1: shift/rotate by 2 
    generate
        for (i = 0; i < 16; i = i + 1) begin 
            wire a, b_sel;
            assign a = stage0[i];

            wire b_rotate, b_shift;

            assign b_rotate = (dir == 1'b0) ? stage0[(i + 14) % 16] : stage0[(i + 2) % 16];

            wire b_shift_left  = (i >= 2)  ? stage0[i - 2] : 1'b0;
            wire b_shift_right = (i <= 13) ? stage0[i + 2] : 1'b0;
            assign b_shift = (dir == 1'b0) ? b_shift_left : b_shift_right;

            assign b_sel = (rotate == 1'b1) ? b_rotate : b_shift;

            mux_2x1 m1 (.a(a), .b(b_sel), .sel(shamt[1]), .y(stage1[i]));
        end
    endgenerate

    // stage2: shift/rotate by 4 
    generate
        for (i = 0; i < 16; i = i + 1) begin 
            wire a, b_sel;
            assign a = stage1[i];

            wire b_rotate, b_shift;

            assign b_rotate = (dir == 1'b0) ? stage1[(i + 12) % 16] : stage1[(i + 4) % 16];

            wire b_shift_left  = (i >= 4)  ? stage1[i - 4] : 1'b0;
            wire b_shift_right = (i <= 11) ? stage1[i + 4] : 1'b0;
            assign b_shift = (dir == 1'b0) ? b_shift_left : b_shift_right;

            assign b_sel = (rotate == 1'b1) ? b_rotate : b_shift;

            mux_2x1 m2 (.a(a), .b(b_sel), .sel(shamt[2]), .y(stage2[i]));
        end
    endgenerate

    // stage3: shift/rotate by 8 
    generate
        for (i = 0; i < 16; i = i + 1) begin 
            wire a, b_sel;
          
            assign a = stage2[i];

            wire b_rotate, b_shift;

            assign b_rotate = (dir == 1'b0) ? stage2[(i + 8) % 16] : stage2[(i + 8) % 16];

            wire b_shift_left  = (i >= 8)  ? stage2[i - 8] : 1'b0;
            wire b_shift_right = (i <= 7)  ? stage2[i + 8] : 1'b0;
            assign b_shift = (dir == 1'b0) ? b_shift_left : b_shift_right;

            assign b_sel = (rotate == 1'b1) ? b_rotate : b_shift;

            mux_2x1 m3 (.a(a), .b(b_sel), .sel(shamt[3]), .y(result_word[i]));
        end
    endgenerate
    
    
endmodule
