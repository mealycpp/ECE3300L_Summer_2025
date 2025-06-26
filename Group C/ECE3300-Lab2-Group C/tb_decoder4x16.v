`timescale 1ns / 1ps

module tb_decoder4x16;

    // Testbench signals
    reg [3:0] A;
    reg E;
    wire [15:0] Y;

    // Instantiate the module you want to test:
    decoder4x16_gate uut (
        .A(A),
        .E(E),
        .Y(Y)
    );

    integer i;

    initial begin
        $display("Starting test...");

        // Test with Enable = 1
        E = 1;
        for (i = 0; i < 16; i = i + 1) begin
            A = i;
            #10;
            if (Y != (1 << i)) begin
                $fatal(1, "FAIL: A=%b E=1 → Y=%b (Expected: %b)", A, Y, (1 << i));
            end else begin
                $display("PASS: A=%b E=1 → Y=%b", A, Y);
            end
        end

        // Test with Enable = 0
        E = 0;
        A = 4'b1010;
        #10;
        if (Y !== 16'b0) begin
            $fatal(1, "FAIL: A=%b E=0 → Y should be all 0s, got %b", A, Y);
        end else begin
            $display("PASS: A=%b E=0 → Y=%b", A, Y);
        end

        $display("All tests passed.");
        $finish;
    end

endmodule
