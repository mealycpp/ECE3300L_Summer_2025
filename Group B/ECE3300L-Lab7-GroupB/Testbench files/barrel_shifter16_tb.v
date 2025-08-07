`timescale 1ns / 1ps

module barrel_shifter16_tb;

    reg [15:0] data_in;
    reg [3:0]  shamt;
    reg        dir;
    reg        rotate;
    wire [15:0] data_out;

    barrel_shifter16 uut (
        .data_in(data_in),
        .shamt(shamt),
        .dir(dir),
        .rotate(rotate),
        .data_out(data_out)
    );

    task run_test(
        input [15:0] word,
        input [3:0] shift_amount,
        input dir_val,
        input rotate_val
    );
        begin
            data_in = word;
            shamt   = shift_amount;
            dir     = dir_val;
            rotate  = rotate_val;
            #10;
            $display("data_in = %h | shamt = %0d | dir = %s | rotate = %s | data_out = %h",
                      data_in, shamt,
                      dir ? "Right" : "Left",
                      rotate ? "Rotate" : "Logical",
                      data_out);
        end
    endtask

    initial begin
        $display("Starting barrel_shifter16_tb\n");

        // Logical Left
        run_test(16'h8001, 4'd1, 0, 0);
        run_test(16'hA5A5, 4'd4, 0, 0);
        run_test(16'hFFFF, 4'd8, 0, 0);

        // Logical Right
        run_test(16'h8001, 4'd1, 1, 0);
        run_test(16'hA5A5, 4'd4, 1, 0);
        run_test(16'hFFFF, 4'd8, 1, 0);

        // Rotate Left
        run_test(16'h8001, 4'd1, 0, 1);
        run_test(16'hA5A5, 4'd4, 0, 1);

        // Rotate Right
        run_test(16'h8001, 4'd1, 1, 1);
        run_test(16'hA5A5, 4'd4, 1, 1);

        $display("\nbarrel_shifter16_tb completed.");
    end

endmodule
