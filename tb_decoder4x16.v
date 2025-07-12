`timescale 1ns / 1ps


module tb_decoder4x16;
    reg  [3:0] A;
    reg        E;
    wire [15:0] Y;

    decoder4x16_gate DUT (.A(A), .E(E), .Y(Y)); // or use behavioral version

    integer i;

    initial begin
        E = 0;
        A = 4'b0000;
        #5;

        // Check outputs are zero when E=0
        if (Y !== 16'b0) $fatal("FAIL: Output not zero when E=0");

        // Loop through all inputs with E=1
        E = 1;
        for (i = 0; i < 16; i = i + 1) begin
            A = i;
            #5;
            if (Y !== (16'b1 << i)) begin
                $display("FAIL: A=%b Expected Y=%b, Got Y=%b", A, (16'b1 << i), Y);
                $fatal;
            end else begin
                $display("PASS: A=%b Y=%b", A, Y);
            end
        end

        $display("All tests passed.");
        $finish;
    end
endmodule