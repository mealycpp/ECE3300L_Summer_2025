`timescale 1ns / 1ps

module control_decoder_tb;

    reg [3:0] ctrl_in;
    wire [3:0] ctrl_out;

    control_decoder dut (
        .ctrl_in(ctrl_in),
        .ctrl_out(ctrl_out)
    );

    initial begin
        $display("Starting testbench for control_decoder...");

        // Test Case 1: All zeros
        ctrl_in = 4'b0000;
        #10;
        if (ctrl_out !== ctrl_in) $display("ERROR: 0000 -> %b", ctrl_out);

        // Test Case 2: Alternating pattern
        ctrl_in = 4'b1010;
        #10;
        if (ctrl_out !== ctrl_in) $display("ERROR: 1010 -> %b", ctrl_out);

        // Test Case 3: Another pattern
        ctrl_in = 4'b0110;
        #10;
        if (ctrl_out !== ctrl_in) $display("ERROR: 0110 -> %b", ctrl_out);

        // Test Case 4: All ones
        ctrl_in = 4'b1111;
        #10;
        if (ctrl_out !== ctrl_in) $display("ERROR: 1111 -> %b", ctrl_out);

        $display("\nTest complete.");
        $finish;
    end

    initial begin
        $monitor("Time = %0t ns | ctrl_in = %b | ctrl_out = %b", $time, ctrl_in, ctrl_out);
    end

endmodule