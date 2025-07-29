`timescale 1ns / 1ps

module bcd_counter_tb(

    );
reg clk;
reg BTN0;//rst_n,
reg dir_bit;//sw7 or sw8 (instantiated twice),
wire[4:0]BCD;

bcd_counter uut (
        .clk_div(clk),        // assuming this is the divided clock input
        .BTN0(BTN0),          // active-low reset
        .dir_bit(dir_bit),    // direction control
        .BCD(BCD)             // counter output
    );
    
initial clk = 0;
always #5 clk = ~clk;

initial begin
dir_bit = 1;
BTN0 = 0;
#10;
BTN0 = 1;
#120
dir_bit = 0;
#130
$finish;
end
endmodule
