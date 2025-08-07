`timescale 1ns / 1ps

module barrel_shifter16_tb;

    reg [15:0] data_in;
    reg [3:0] shamt;
    reg dir;
    reg rotate;
    wire [15:0] data_out;

    // Instantiate DUT
    barrel_shifter16 uut (
        .data_in(data_in),
        .shamt(shamt),
        .dir(dir),
        .rotate(rotate),
        .data_out(data_out)
    );

    initial begin

        // Test case 1: logical left shift by 1
        data_in = 16'hA5A5; shamt = 4'd1; dir = 0; rotate = 0;
        #10;

        // Test case 2: logical right shift by 1
        data_in = 16'hA5A5; shamt = 4'd1; dir = 1; rotate = 0;
        #10;

        // Test case 3: rotate left by 4
        data_in = 16'h8001; shamt = 4'd4; dir = 0; rotate = 1;
        #10;

        // Test case 4: rotate right by 8
        data_in = 16'h8001; shamt = 4'd8; dir = 1; rotate = 1;
        #10;

        // Test case 5: logical left shift by 0
        data_in = 16'h1234; shamt = 4'd0; dir = 0; rotate = 0;
        #10;

        // Done
        $finish;
    end

endmodule
