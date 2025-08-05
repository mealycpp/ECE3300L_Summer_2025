`timescale 1ns / 1ps

module barrel_shifter16(
    input wire [15:0] data_in,
    input wire [3:0] shamt,
    input wire dir,      
    input wire rotate,  
    output wire [15:0] data_out
);

    wire [15:0] stage[4:0];
    assign stage[0] = data_in;
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : STAGES
            wire [15:0] current_data = stage[i];
            wire [15:0] shifted_data;
            
            localparam shift_val = 1 << i;

            wire [15:0] logical_left  = current_data << shift_val;
            wire [15:0] rotate_left   = {current_data[15-shift_val:0], current_data[15:16-shift_val]};
            wire [15:0] logical_right = current_data >> shift_val;
            wire [15:0] rotate_right  = {current_data[shift_val-1:0], current_data[15:shift_val]};
            wire [15:0] left_result  = rotate ? rotate_left  : logical_left;
            wire [15:0] right_result = rotate ? rotate_right : logical_right;
            
            assign shifted_data = (dir == 1'b0) ? left_result : right_result;
            assign stage[i+1] = shamt[i] ? shifted_data : current_data;
        end
    endgenerate

    assign data_out = stage[4];
    
endmodule