`timescale 1ns / 1ps

module seg7_tb(

    );
    reg clk;
    reg rst_n;
    reg [15:0]SW;
    wire[6:0]Cnode;
    wire[7:0]AN;
    wire dp;
    
    sec7_top DUT(
    .clk(clk),
    .rst_n(rst_n),
    .SW(SW),
    .Cnode(Cnode),
    .AN(AN),
    .dp(dp)
    );
    always #5 clk = ~clk;
    initial begin
    
    clk = 0;
    rst_n = 0;
    SW = 16'b0;
    #10;
    SW = 16'b1111000111100011;
    
    #200000;
    $finish;
    end
endmodule
