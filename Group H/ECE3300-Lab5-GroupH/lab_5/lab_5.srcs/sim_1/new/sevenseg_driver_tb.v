`timescale 1ns / 1ps

module sevenseg_driver_tb;

    reg clk;
    reg rst_n;
    reg [3:0] units;
    reg [3:0] tens;

    wire [6:0] SEG;
    wire [1:0] AN;

    sevenseg_driver uut (
        .clk(clk),
        .rst_n(rst_n),
        .units(units),
        .tens(tens),
        .SEG(SEG),
        .AN(AN)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $display("Starting sevenseg_driver_tb...");
        $monitor("Time=%0t | units=%d, tens=%d | AN=%b, SEG=%b", $time, units, tens, AN, SEG);

        rst_n = 0;
        units = 4'dx;
        tens = 4'dx;
        #20;
        rst_n = 1;
        #10;

        $display("\nDisplaying the number 83");
        units = 4'd3;
        tens = 4'd8;
        #700000;

        $display("\nDisplaying the number 57");
        units = 4'd7;
        tens = 4'd5;
        #700000;

        $display("Finished sevenseg_driver_tb.");
        $stop;
    end

endmodule