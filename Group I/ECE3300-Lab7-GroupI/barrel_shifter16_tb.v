`timescale 1ns / 1ps

module barrel_shifter16_tb;

    reg  [15:0] data_in;
    reg  [3:0]  shamt;
    reg         dir;
    reg         rotate;
    wire [15:0] data_out;

    // Instantiate the module under test
    barrel_shifter16 uut (
        .data_in(data_in),
        .shamt(shamt),
        .dir(dir),
        .rotate(rotate),
        .data_out(data_out)
    );

    // Test vectors for data_in
    reg [15:0] test_patterns[0:5];
    integer i, s, d, r;

    initial begin
        // Initialize test patterns
        test_patterns[0] = 16'hA5A5;
        test_patterns[1] = 16'h8001;
        test_patterns[2] = 16'h0001;
        test_patterns[3] = 16'h8000;
        test_patterns[4] = 16'hFFFF;
        test_patterns[5] = 16'h0000;

        // Header for output
        $display("Time | data_in   shamt dir rot | data_out");
        $display("-----|-------------------------|----------");

        for (i = 0; i < 6; i = i + 1) begin
            data_in = test_patterns[i];
            for (s = 0; s < 16; s = s + 1) begin
                shamt = s[3:0];
                for (d = 0; d < 2; d = d + 1) begin
                    dir = d;
                    for (r = 0; r < 2; r = r + 1) begin
                        rotate = r;
                        #5; // Wait for signal propagation
                        $display("%4dns | %h   %2d    %1b   %1b  | %h", 
                                 $time, data_in, shamt, dir, rotate, data_out);
                    end
                end
            end
        end

        $display("Test completed.");
        $finish;
    end

endmodule
