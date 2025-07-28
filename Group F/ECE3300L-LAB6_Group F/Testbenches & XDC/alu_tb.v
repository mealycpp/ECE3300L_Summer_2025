// alu_tb.v
`timescale 1ns / 1ps

module alu_tb;
    // Declare inputs as regs and outputs as wires
    reg [3:0] A, B;
    reg [2:0] opcode;
    wire [3:0] Y;
    wire cout, zero;

    // Instantiate the ALU
    alu uut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .Y(Y),
        .cout(cout),
        .zero(zero)
    );

    initial begin
        // Monitor values
        $monitor("Time=%0t A=%h B=%h opcode=%b | Y=%h cout=%b zero=%b", $time, A, B, opcode, Y, cout, zero);

        // Test case 1: Addition
        A = 4'h3; B = 4'h5; opcode = 3'b000; #10;
        // Test case 2: Subtraction
        A = 4'h7; B = 4'h2; opcode = 3'b001; #10;
        // Test case 3: AND
        A = 4'hF; B = 4'hA; opcode = 3'b010; #10;
        // Test case 4: OR
        A = 4'h6; B = 4'h9; opcode = 3'b011; #10;
        // Test case 5: XOR
        A = 4'hC; B = 4'h7; opcode = 3'b100; #10;
        // Test case 6: Zero output
        A = 4'h0; B = 4'h0; opcode = 3'b000; #10;

        // Add more tests as needed for your ALU functions

        $finish;
    end
endmodule
