`timescale 1ns / 1ps
module tb_clock_divider;

reg clk = 0;
reg rst_n = 0;
wire [31:0] tick_count;

clock_divider uut (
    .sys_clk(clk),
    .reset_n(rst_n),
    .tick_count(tick_count)
);

always #5 clk = ~clk;

initial begin
    $display("Test clock divider");
    rst_n = 0; #10; rst_n = 1;
    #100;
    $finish;
end

endmodule
