`timescale 1ns / 1ps

module bcd_counter_tb;

    reg clk_test;
    reg reset_test;
    reg direction_test;
    wire [3:0] bcd_out;

    bcd_counter dut_instance (
        .clk(clk_test),
        .rst_n(reset_test),
        .dir(direction_test),
        .bcd(bcd_out)
    );

    initial begin
        clk_test = 0;
        forever #10 clk_test = ~clk_test;
    end

    initial begin
        reset_test = 0; direction_test = 1;
        #20 reset_test = 1;
        #200 direction_test = 0;
        #200 $stop;
    end

endmodule
