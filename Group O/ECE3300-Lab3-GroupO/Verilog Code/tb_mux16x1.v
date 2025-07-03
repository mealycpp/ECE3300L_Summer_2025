`timescale 1ns / 1ps

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

        in_tb = 16'b0110_1100_0101_1100;
        sel_tb = 4'b0000;

        for (i = 0; i < 16; i = i + 1) begin
            sel_tb = i;
            #10; 

            if (out_tb !== in_tb[i])
                $fatal(1, "FAIL: sel=%0d | out=%b", i, out_tb);
            else
                $display("PASS: sel=%0d | out=%b", i, out_tb);
        end

        $display("tests finished successfully.");
        $finish;
    end

endmodule

