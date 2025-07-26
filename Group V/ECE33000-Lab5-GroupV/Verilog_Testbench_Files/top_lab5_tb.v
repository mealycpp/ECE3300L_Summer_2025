`timescale 1ns / 1ps
module top_lab5_tb();
//instantiate registers, wires, dut
reg clk;
reg rst_n;
reg dir;
reg [4:0] sw;
wire [7:0] an;
wire [6:0] seg;
wire [7:0] led;

reg [4:0] tens;
reg [4:0] units;

top_lab5 testbench (
    .clk(clk),
    .rst_n(rst_n),
    .dir(dir),
    .sw(sw),
    .an(an),
    .seg(seg),
    .led(led)
);
//for debugging purposes, we want to see the value of LED (for the waveform)
always @(*) begin
    tens = led[7:4];
    units = led[3:0];
end

always #5 clk = ~clk;

initial begin
//set clock = 0, reset to low(currently reset), direction is counting down. set clock to fastest frequency, wait 50ns
    clk = 0;
    rst_n = 0;
    dir = 0;
    sw = 5'b11111;
    #50;
    //reset goes high, start counting down for 600ns
    rst_n = 1;
    #600;
    //count up for 600ns
    dir = 1;
    #600;
    $finish;
end
endmodule
