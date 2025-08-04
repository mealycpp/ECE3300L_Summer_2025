`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 08/04/2025 12:54:20 PM
// Design Name: 
// Module Name: barrel_shifter16_tb
// Project Name: barrel_shifter16_tb
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
    reg dir;
    reg rotate;
    wire [15:0] data_out;

    barrel_shifter16 uut (
        .data_in(data_in),
        .shamt(shamt),
        .dir(dir),
        .rotate(rotate),
        .data_out(data_out)
    );

    initial begin
        data_in = 16'hA5A5;

        for (dir = 0; dir <= 1; dir = dir + 1) begin
            for (rotate = 0; rotate <= 1; rotate = rotate + 1) begin
                for (shamt = 0; shamt < 16; shamt = shamt + 1) begin
                    #10;
                end
            end
        end

        data_in = 16'h8001;

        for (dir = 0; dir <= 1; dir = dir + 1) begin
            for (rotate = 0; rotate <= 1; rotate = rotate + 1) begin
                for (shamt = 0; shamt < 16; shamt = shamt + 1) begin
                    #10;
                end
            end
        end

        #20;
        $finish;
    end
endmodule
