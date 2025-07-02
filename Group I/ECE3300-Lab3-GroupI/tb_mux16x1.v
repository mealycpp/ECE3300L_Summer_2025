`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2025 05:16:16 PM
// Design Name: 
// Module Name: tb_mux16x1
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

module tb_mux16x1;

    reg [15:0] in_tb;
    reg [3:0] sel_tb;
    wire out_tb;

    mux16x1 DUT (
        .in(in_tb),
        .sel(sel_tb),
        .out(out_tb)
    );

    integer i;  

    initial begin
        in_tb = 16'b1001_0011_1010_0110;  
        sel_tb = 4'b0000;

        #5;

        for (i = 0; i < 16; i = i + 1) begin
            sel_tb = i;
            #10;

            if (out_tb !== in_tb[i])
                $fatal(1, "FAIL: sel=%0d | Expected=%b | Got=%b", i, in_tb[i], out_tb);
            else
                $display("PASS: sel=%0d | out=%b", i, out_tb);
        end

        $display("All tests completed successfully.");
        $finish;
    end

endmodule
