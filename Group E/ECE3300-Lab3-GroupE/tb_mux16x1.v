`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: ECE
// 
// Create Date: 06/30/2025 11:50:35 AM
// Design Name: 
// Module Name: tb_mux16x1
// Project Name: tb_mux16x1
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

module tb_mux16x1;

    // Testbench signals
    reg [15:0] in_tb;
    reg [3:0] sel_tb;
    wire out_tb;

    // Instantiate 
    mux16x1 DUT (
        .in(in_tb),
        .sel(sel_tb),
        .out(out_tb)
    );

    integer i;  //  Declare loop variable

    initial begin
        // Initialize inputs
        in_tb = 16'b1010_1010_1010_1010;  // Example input pattern
        sel_tb = 4'b0000;

        // Test all select values from 0 to 15
        for (i = 0; i < 16; i = i + 1) begin
            sel_tb = i;
            #10;  // Wait 10ns 

            if (out_tb !== in_tb[i])
                $fatal(1, "FAIL: sel=%0d | Expected=%b | Got=%b", i, in_tb[i], out_tb);
            else
                $display("PASS: sel=%0d | out=%b", i, out_tb);
        end

        $display(" All tests completed successfully.");
        $finish;
    end

endmodule



