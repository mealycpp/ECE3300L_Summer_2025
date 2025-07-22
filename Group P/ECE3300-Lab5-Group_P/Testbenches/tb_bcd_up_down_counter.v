`timescale 1ns / 1ps
module tb_bcd_up_down_counter;

reg clk = 0;
reg rst_n = 1;
reg dir_up = 1;
reg enable = 1;
wire [3:0] bcd_value;
wire carry_pulse;

bcd_up_down_counter uut (
    .clk_pulse(clk),
    .rst_n(rst_n),
    .dir_up(dir_up),
    .enable_count(enable),
    .bcd_value(bcd_value),
    .carry_pulse(carry_pulse)
);

always #10 clk = ~clk;

initial begin
    $display("Testing BCD Counter");
    rst_n = 0; #20;
    rst_n = 1;
    #200;
    dir_up = 0; // test down count
    #200;
    $finish;
end

endmodule
