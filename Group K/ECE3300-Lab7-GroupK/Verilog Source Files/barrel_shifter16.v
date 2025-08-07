`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Andy Siu
// 
// Create Date: 08/06/2025 03:54:00 AM
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
    input wire [3:0] shamnt,
    input wire dir,           
    input wire rotate,
    input wire [15:0] data_in,
    output wire [15:0] data_out
    );
    
    wire [15:0] step [0:4];  // Input + 4 shift steps
    
        assign step[0] = data_in;

        genvar i;
            generate
                for (i = 0; i < 4; i = i + 1) begin : shift_step
  
                    wire [15:0] shifted;
                    wire [15:0] fill;

                    // Shift up
                    localparam integer shift = 1 << i;

                    // Fill bits depend on rotate vs logical
                    assign fill = (rotate) ?  (dir ? step[i] << (16 - shift) : step[i] >> (16 - shift)) :  16'b0;

            assign shifted = (dir) ?  (step[i] >> shift) | fill : (step[i] << shift) | fill;
            assign step[i+1] = (shamnt[i]) ? shifted : step[i];
        end
    endgenerate

    assign data_out = step[4];

endmodule