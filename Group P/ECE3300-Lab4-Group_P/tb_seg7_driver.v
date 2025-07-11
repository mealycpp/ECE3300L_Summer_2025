`timescale 1ns / 1ps

module tb_seg7_driver();

    reg clk;
    reg rst_n;
    reg [31:0] SW;
    wire [6:0] Cnode;
    wire dp;
    wire [7:0] AN;

    // Instantiate driver module
    seg7_driver uut (
        .clk(clk),
        .rst_n(rst_n),
        .SW(SW),
        .Cnode(Cnode),
        .dp(dp),
        .AN(AN)
    );

    // generate 100 MHz clock
    always #5 clk = ~clk;

    // task to apply switch pattern with reset
    task Display7seg;
        input [31:0] pattern;
        begin
            $display("Applying switch pattern: %h", pattern);
            rst_n = 0;
            #10;
            SW = pattern;
            #10;
            rst_n = 1;
            #20;
            rst_n = 0;
            #10;
        end
    endtask

    initial begin
        clk = 0;
        rst_n = 0;
        SW = 0;

        // Apply various switch patterns
        Display7seg(32'h89ABCDEF);
        Display7seg(32'h01234567);
        Display7seg(32'h13655365);
        Display7seg(32'h96ACE534);
        Display7seg(32'hFED08A25);

        #60;
        $finish;
    end

endmodule