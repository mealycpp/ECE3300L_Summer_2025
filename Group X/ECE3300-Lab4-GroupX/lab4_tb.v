`timescale 1ns / 1ps

module seg7_driver_tb;

    reg clk_tb;
    reg rst_n;
    reg [31:0] SW_tb;
    wire [6:0] Cnode_tb;
    wire dp_tb;
    wire [7:0] AN_tb;

    seg7_driver DUT (
        .clk(clk_tb),
        .rst_n(rst_n),
        .SW(SW_tb),
        .seg(Cnode_tb),
        .dp(dp_tb),
        .AN(AN_tb)
    );

    // Clock generation
    always #5 clk_tb = ~clk_tb;

    initial begin
        // Initialize signals
        clk_tb = 0;
        rst_n = 0;
        SW_tb = 32'b0;

        #20 rst_n = 1;
        #20 SW_tb = 32'h1234ABCD;

        #1000;
        $stop;
    end

endmodule
