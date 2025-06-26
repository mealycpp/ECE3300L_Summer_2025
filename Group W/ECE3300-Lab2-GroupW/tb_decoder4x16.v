module tb_decoder4x16;

    reg [3:0] A_tb;
    reg E_tb;
    wire [15:0] Y_tb;

    decoder4x16_behav tb (
        .A(A_tb),
        .E(E_tb),
        .Y(Y_tb)
    );

    // Task for checking expected output
    task check_output;
        input [3:0] a_in;
        input e_in;
        input [15:0] expected;
        begin
            A_tb = a_in;
            E_tb = e_in;
            #10;
            if (Y_tb !== expected) begin
                $display("FAIL: A=%b E=%b → Y=%b (expected %b)", A_tb, E_tb, Y_tb, expected);
                $fatal;
            end else begin
                $display("PASS: A=%b E=%b → Y=%b", A_tb, E_tb, Y_tb);
            end
        end
    endtask

    initial begin
        $display("=== Starting Decoder Testbench ===");

        // Enabled: only one output should be high
        check_output(4'b0000, 1'b1, 16'b0000_0000_0000_0001);
        check_output(4'b0001, 1'b1, 16'b0000_0000_0000_0010);
        check_output(4'b0010, 1'b1, 16'b0000_0000_0000_0100);
        check_output(4'b0011, 1'b1, 16'b0000_0000_0000_1000);
        check_output(4'b0100, 1'b1, 16'b0000_0000_0001_0000);
        check_output(4'b0101, 1'b1, 16'b0000_0000_0010_0000);
        check_output(4'b0110, 1'b1, 16'b0000_0000_0100_0000);
        check_output(4'b0111, 1'b1, 16'b0000_0000_1000_0000);
        check_output(4'b1000, 1'b1, 16'b0000_0001_0000_0000);
        check_output(4'b1001, 1'b1, 16'b0000_0010_0000_0000);
        check_output(4'b1010, 1'b1, 16'b0000_0100_0000_0000);
        check_output(4'b1011, 1'b1, 16'b0000_1000_0000_0000);
        check_output(4'b1100, 1'b1, 16'b0001_0000_0000_0000);
        check_output(4'b1101, 1'b1, 16'b0010_0000_0000_0000);
        check_output(4'b1110, 1'b1, 16'b0100_0000_0000_0000);
        check_output(4'b1111, 1'b1, 16'b1000_0000_0000_0000);

        // Disabled: all outputs should be low
        check_output(4'b0000, 1'b0, 16'b0000_0000_0000_0000);
        check_output(4'b0001, 1'b0, 16'b0000_0000_0000_0000);
        check_output(4'b0010, 1'b0, 16'b0000_0000_0000_0000);
        check_output(4'b0011, 1'b0, 16'b0000_0000_0000_0000);
        check_output(4'b0100, 1'b0, 16'b0000_0000_0000_0000);
        check_output(4'b0101, 1'b0, 16'b0000_0000_0000_0000);
        check_output(4'b0110, 1'b0, 16'b0000_0000_0000_0000);
        check_output(4'b0111, 1'b0, 16'b0000_0000_0000_0000);
        check_output(4'b1000, 1'b0, 16'b0000_0000_0000_0000);
        check_output(4'b1001, 1'b0, 16'b0000_0000_0000_0000);
        check_output(4'b1010, 1'b0, 16'b0000_0000_0000_0000);
        check_output(4'b1011, 1'b0, 16'b0000_0000_0000_0000);
        check_output(4'b1100, 1'b0, 16'b0000_0000_0000_0000);
        check_output(4'b1101, 1'b0, 16'b0000_0000_0000_0000);
        check_output(4'b1110, 1'b0, 16'b0000_0000_0000_0000);
        check_output(4'b1111, 1'b0, 16'b0000_0000_0000_0000);

        $display("=== All Decoder Tests Passed ===");
        $finish;
    end
endmodule
