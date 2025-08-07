`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2025 08:03:21 PM
// Design Name: 
// Module Name: barrel_shifter16_tb
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


module barrel_shifter16_tb;
    reg [15:0] data_in;
    reg [3:0] shamt;
    reg dir, rotate;
    wire [15:0] data_out;

    barrel_shifter16 uut (
        .DATA_IN(data_in),
        .SHAMT(shamt),
        .DIR(dir),
        .ROTATE(rotate),
        .DATA_OUT(data_out)
    );

    initial begin
        $display("Testing barrel_shifter16");
        data_in = 16'hA5A5; // test pattern
        dir = 0; rotate = 0; // logical left
        for (shamt = 0; shamt < 16; shamt = shamt + 1) begin
            #10;
            $display("LL shamt=%0d out=%h", shamt, data_out);
        end

        dir = 1; rotate = 0; // logical right
        for (shamt = 0; shamt < 16; shamt = shamt + 1) begin
            #10;
            $display("LR shamt=%0d out=%h", shamt, data_out);
        end

        dir = 0; rotate = 1; // rotate left
        for (shamt = 0; shamt < 16; shamt = shamt + 1) begin
            #10;
            $display("RL shamt=%0d out=%h", shamt, data_out);
        end

        dir = 1; rotate = 1; // rotate right
        for (shamt = 0; shamt < 16; shamt = shamt + 1) begin
            #10;
            $display("RR shamt=%0d out=%h", shamt, data_out);
        end

        $finish;
    end
endmodule
