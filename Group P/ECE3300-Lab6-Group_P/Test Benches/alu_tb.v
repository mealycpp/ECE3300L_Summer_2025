`timescale 1ns / 1ps

module tb_alu;

    // Inputs
    reg [3:0] A_val;
    reg [3:0] B_val;
    reg [1:0] control_bits;

    // Output
    wire [7:0] result_out;

    // Instantiate the ALU
    alu uut (
        .A_val(A_val),
        .B_val(B_val),
        .control_bits(control_bits),
        .result_out(result_out)
    );

    // Stimulus
    initial begin
        $display("Time\tA\tB\tctrl\tResult");
        // ADD cases
        control_bits = 2'b00;
        A_val = 4'd3; B_val = 4'd5; #10;    // 3 + 5 = 8
        A_val = 4'd8; B_val = 4'd7; #10;    // 8 + 7 = 15
        A_val = 4'd9; B_val = 4'd9; #10;    // 9 + 9 = 18 (overflow into 5-bit result)

        // SUB cases
        control_bits = 2'b01;
        A_val = 4'd9; B_val = 4'd3; #10;    // 9 - 3 = 6
        A_val = 4'd3; B_val = 4'd5; #10;    // 3 - 5 = -2 (two's complement: 8'b11111110)

        // Default case
        control_bits = 2'b10;
        A_val = 4'd4; B_val = 4'd4; #10;    // Should output 0 (unsupported op)

        control_bits = 2'b11;
        A_val = 4'd1; B_val = 4'd2; #10;    // Should output 0 (unsupported op)

        $finish;
    end

endmodule
