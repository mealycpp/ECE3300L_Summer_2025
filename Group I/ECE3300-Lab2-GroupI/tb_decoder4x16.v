`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 04:46:45 PM
// Design Name: 
// Module Name: tb_decoder4x16
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


module tb_decoder4x16;

    // Testbench signals
    reg [3:0] A;
    reg E;
    wire [15:0] Y;

    // Instantiate the module you want to test:
    Decoder4x16_Behavioral uut (
        .A(A),
        .E(E        .Y(Y)
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

    // --- Test E = 0 ---
    E = 0;
    for (A = 0; A < 16; A = A + 1) begin
      #1;
      if (Y !== 16'b0) begin
        $display("FAIL: A=%b E=0 Y=%b (Expected 000...000)", A, Y);
        $fatal;
      end else begin
        $display("PASS: A=%b E=0 Y=%b", A, Y);
      end
    end

    $display("All tests passed.");
    $finish;
  end

endmodule