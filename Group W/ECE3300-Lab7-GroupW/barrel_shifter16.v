`timescale 1ns / 1ps

module barrel_shifter16(
    input wire [15:0] data_in,
    input wire [3:0] shamt,
    input wire dir,           // 0 = left, 1 = right
    input wire rotate,        // 0 = logical, 1 = rotate
    output wire [15:0] data_out
    );
    
    
    
    
    wire [15:0] stage [0:4];  // 5 stages: input + 4 shift stages
        assign stage[0] = data_in;

        genvar i;
            generate
                for (i = 0; i < 4; i = i + 1) begin : shift_stage
                    wire [15:0] shifted;
                    wire [15:0] fill;

                    // Shift amount for this stage: 2^i
                    localparam integer SHIFT = 1 << i;

                    // Fill bits depend on rotate vs logical
                    assign fill = (rotate) ?
                        (dir ? stage[i] << (16 - SHIFT) : stage[i] >> (16 - SHIFT)) :
                        16'b0;

            assign shifted = (dir) ?
                (stage[i] >> SHIFT) | fill :
                (stage[i] << SHIFT) | fill;

            assign stage[i+1] = (shamt[i]) ? shifted : stage[i];
        end
    endgenerate

    assign data_out = stage[4];

endmodule

