`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Andy Siu
// 
// Create Date: 08/06/2025 07:05:18 PM
// Design Name: 
// Module Name: barrel_shifter_tb
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
    reg [3:0] shamnt;
    reg dir;
    reg rotate;
    reg [15:0] data_in;
    wire [15:0] data_out;

    barrel_shifter16 uut (
        .shamnt(shamnt),
        .dir(dir),
        .rotate(rotate),
        .data_in(data_in),
        .data_out(data_out)
    );

    initial begin

        // Test 1: Logical left shift by 1
        rotate = 0;
        dir = 0;
        shamnt = 4'd1;
        data_in = 16'h1234;
        #10;

        // Test 2: Logical right shift by 2
        rotate = 0;
        dir = 1;
        shamnt = 4'd2;
        data_in = 16'h1234;
        #10;

        // Test 3: Rotate left by 4
        rotate = 1;
        dir = 0;
        shamnt = 4'd4;
        data_in = 16'hABCD;
        #10;

        // Test 4: Rotate right by 8
        rotate = 1;
        dir = 1;
        shamnt = 4'd8;
        data_in = 16'hABCD;
        #10;

        // Test 5: No shift
        rotate = 0;
        dir = 0;
        shamnt = 4'd0;
        data_in = 16'hFFFF;
        #10;

        $finish;
    end

endmodule
