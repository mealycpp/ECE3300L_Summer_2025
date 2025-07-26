`timescale 1ns / 1ps
module bcd_updown_tb();
//instantiate registers, wires, dut
reg clk;
reg rst_n;
reg dir;
wire [7:0] leds;
wire [3:0] units;
wire [3:0] tens;

bcd_up_down_counter testbench (
    .clk(clk),
    .rst_n(rst_n),
    .dir(dir),
    .leds(leds),
    .units(units),
    .tens(tens)
);
//set clock
initial clk = 0;
always #5 clk = ~clk;
initial begin
//dir =0(count down), rst_n is low so units and tens stay 0.
    dir = 0;
    rst_n = 0;
    #20;
//dir stays low, but rst_n goes high allowing circuit to count down for 200ns
    dir = 0;
    rst_n = 1;
    #200;
//dir is high so we count up for 200ns
    dir = 1;
    #200;
    $finish;
end

endmodule
