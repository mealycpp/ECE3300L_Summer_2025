`timescale 1ns / 1ps

module mux32x1_tb;
    reg [31:0] cnt;
    reg [4:0] sel;
    wire clk_out;

    mux32x1 tb (
        .cnt(cnt),
        .sel(sel),
        .clk_out(clk_out)
    );

    initial begin
        cnt = 32'b01010101010101010101010101010101; 
        sel = 0;
        repeat (32) begin 
            #5;
            sel = sel + 1;
        end
        #15;
        $finish;
    end
endmodule
