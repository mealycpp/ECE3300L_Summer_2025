`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 09:21:16 PM
// Design Name: 
// Module Name: tb_gate_decoder4x16
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////




module tb_gate_decoder4x16;

    reg [3:0] A;
    reg E;
    wire [15:0] Y;
    integer i;

    // Instantiate gate-level 4-to-16 decoder
    decoder4x16_gate DUT (
        .A(A),
        .E(E),
        .Y(Y)
    );

    // Expected outputs for A = 0 to 15
    reg [15:0] expectedOutput [0:15];

    initial begin
        // Fill expected output table
        expectedOutput[0]  = 16'h0001;
        expectedOutput[1]  = 16'h0002;
        expectedOutput[2]  = 16'h0004;
        expectedOutput[3]  = 16'h0008;
        expectedOutput[4]  = 16'h0010;
        expectedOutput[5]  = 16'h0020;
        expectedOutput[6]  = 16'h0040;
        expectedOutput[7]  = 16'h0080;
        expectedOutput[8]  = 16'h0100;
        expectedOutput[9]  = 16'h0200;
        expectedOutput[10] = 16'h0400;
        expectedOutput[11] = 16'h0800;
        expectedOutput[12] = 16'h1000;
        expectedOutput[13] = 16'h2000;
        expectedOutput[14] = 16'h4000;
        expectedOutput[15] = 16'h8000;

        // Test with Enable = 1
        $display("\n===== ENABLE = 1 =====");
        E = 1;
        for (i = 0; i < 16; i = i + 1) begin
            A = i;
            #10;
            $display("A = %h | Y = %h | Expected = %h | %s", A, Y, expectedOutput[i], (Y == expectedOutput[i]) ? "PASSED" : "FAILED");
        end

        // Test with Enable = 0
        $display("\n===== ENABLE = 0 =====");
        E = 0;
        for (i = 0; i < 16; i = i + 1) begin
            A = i;
            #10;
            $display("A = %h | Y = %h | Expected = 0000 | %s", A, Y, (Y == 16'h0000) ? "PASSED" : "FAILED");
        end

        $finish;
    end

endmodule

