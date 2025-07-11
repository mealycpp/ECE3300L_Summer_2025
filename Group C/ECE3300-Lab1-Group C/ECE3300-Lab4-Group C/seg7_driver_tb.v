`timescale 1ns / 1ps

module seg7_driver_tb();

    reg clk, rst_n;
    reg [15:0] SW;
    wire [6:0] Cnode;
    wire dp;
    wire [7:0] AN;
    wire [15:0] LED;

    // Instantiate seg7_driver
    seg7_driver uut (
        .clk(clk),
        .SW(SW),
        .rst_n(rst_n),
        .Cnode(Cnode),
        .dp(dp),
        .AN(AN),
        .LED(LED)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 0;
        SW = 16'h0000;

        #20 rst_n = 1;

        SW = 16'hBEEF;     
        #2_000_000;        

        SW = 16'h1234;     
        #2_000_000;        

        $finish;
    end

endmodule
