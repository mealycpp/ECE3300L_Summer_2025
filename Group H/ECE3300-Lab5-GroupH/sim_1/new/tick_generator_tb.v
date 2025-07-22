`timescale 1ns / 1ps

module tick_generator_tb;

    reg clk;
    reg rst_n;
    reg [4:0] sw;

    wire tick;

    tick_generator uut (
        .clk(clk),
        .rst_n(rst_n),
        .sw(sw),
        .tick(tick)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $display("Starting tick_generator_tb...");
        $monitor("Time = %0t | rst_n = %b | sw = %d | tick = %b", $time, rst_n, sw, tick);

        rst_n = 0;
        sw = 5'd0;
        #20;
        rst_n = 1;
        #10;

        $display("\nTesting with sw = 30 (tick every 4 clocks)");
        sw = 5'd30;
        #100;

        $display("\nTesting with sw = 29 (tick every 8 clocks)");
        sw = 5'd29;
        #200;

        $display("\nTesting reset during operation");
        rst_n = 0;
        #20;
        rst_n = 1;
        #50;

        $display("Finished tick_generator_tb.");
        $stop;
    end

endmodule
