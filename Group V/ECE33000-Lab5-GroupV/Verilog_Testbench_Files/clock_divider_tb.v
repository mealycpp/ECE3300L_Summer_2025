`timescale 1ns / 1ps

module
//instantiatiion of all register, wires, etc.
clock_divider_tb(
);
reg clk;
reg rst_n;
wire[31:0]cnt;

clock_divider testbench(
.clk(clk),
.rst_n(rst_n),
.cnt(cnt)
);
//clock
initial clk = 0;
always #5 clk =~ clk;

//test clock/counting by pressing and releasing reset.
initial begin
rst_n = 0; //press reset for 30 ns
#30;
rst_n = 1; //release reset for 300ns
#300;
rst_n = 0; //press reset for 30 ns
#30
$finish;
end
endmodule