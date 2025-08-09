`timescale 1ns / 1ps

module barrel_shifter16_tb;

    reg  [15:0] data_in;
    reg  [3:0] shamt;
    reg  dir;
    reg  rotate;
    wire [15:0] data_out;

    barrel_shifter16 uut (
        .data_in(data_in),
        .shamt(shamt),
        .dir(dir),
        .rotate(rotate),
        .data_out(data_out)
    );

    initial begin
        $display("Time | DIR ROT SHAMT DATA_IN => DATA_OUT");

        data_in = 16'hA5A5;
        dir = 0; rotate = 0;

        for (shamt = 0; shamt < 16; shamt = shamt + 1) begin
            #10;
            $display("%4dns |  %b    %b    %2d   %h => %h", $time, dir, rotate, shamt, data_in, data_out);
        end

        dir = 1; rotate = 0;
        for (shamt = 0; shamt < 16; shamt = shamt + 1) #10;

        dir = 0; rotate = 1;
        for (shamt = 0; shamt < 16; shamt = shamt + 1) #10;

        dir = 1; rotate = 1;
        for (shamt = 0; shamt < 16; shamt = shamt + 1) #10;

        $finish;
    end

endmodule
