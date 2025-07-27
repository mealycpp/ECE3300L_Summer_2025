`timescale 1ns / 1ps

module alu_tb;

    reg [3:0] A;
    reg [3:0] B;
    reg [1:0] ctrl;
    wire [7:0] result;

    alu dut (
        .A(A),
        .B(B),
        .ctrl(ctrl),
        .result(result)
    );

    initial begin
        $display("Starting testbench for alu...");

        // --- Test Case 1: Addition (ctrl = 00) ---
        $display("\n--- Testing Addition (ctrl=00) ---");
        ctrl = 2'b00;

        A = 4'd5; B = 4'd3; // 5 + 3 = 8
        #10;
        if (result !== 8'd8) $display("ERROR: 5+3 != %d", result);

        A = 4'd9; B = 4'd9; // 9 + 9 = 18
        #10;
        if (result !== 8'd18) $display("ERROR: 9+9 != %d", result);

        A = 4'd0; B = 4'd0; // 0 + 0 = 0
        #10;
        if (result !== 8'd0) $display("ERROR: 0+0 != %d", result);


        // --- Test Case 2: Subtraction (ctrl = 01) ---
        $display("\n--- Testing Subtraction (ctrl=01) ---");
        ctrl = 2'b01;

        A = 4'd8; B = 4'd2; // 8 - 2 = 6
        #10;
        if (result !== 8'd6) $display("ERROR: 8-2 != %d", result);

        A = 4'd3; B = 4'd7; // 3 - 7 = -4 (wraps to 252 in 8 bits)
        #10;
        if (result !== 8'hFC) $display("ERROR: 3-7 did not wrap correctly. Got %d", result);

        A = 4'd5; B = 4'd5; // 5 - 5 = 0
        #10;
        if (result !== 8'd0) $display("ERROR: 5-5 != %d", result);


        // --- Test Case 3: Default Operation ---
        $display("\n--- Testing Default Case (ctrl=10) ---");
        ctrl = 2'b10;
        A = 4'd9; B = 4'd8;
        #10;
        if (result !== 8'd0) $display("ERROR: Default case did not result in 0. Got %d", result);


        $display("\nTest complete.");
        $finish;
    end

    initial begin
        $monitor("Time = %0t ns | A=%d, B=%d, ctrl=%b | result=%d", $time, A, B, ctrl, result);
    end

endmodule