`timescale 1ns / 1ps

module mux32x1_tb();
    reg [31:0] count;
    reg [4:0] sel;
    wire clk_out;
    
    mux32x1 uut(
                .count(count),
                .sel(sel),
                .clk_out(clk_out)
                );
    
    initial begin
        count = 32'b10101010101010101010101010101010;
        sel = 0;
        #20
        repeat(32) begin
            #10
            sel <= sel + 1;
            end
        #20
        $finish;
    end
    
endmodule
