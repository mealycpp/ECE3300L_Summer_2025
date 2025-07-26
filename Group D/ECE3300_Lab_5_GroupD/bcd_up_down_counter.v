// bryan

module bcd_up_down_counter (
    input clk_div, rst_n, dir,
    output [3:0] digit0, digit1
);
    wire roll;
    bcd_digit u0 (.clk(clk_div), .rst_n(rst_n), .dir(dir), .en(1'b1), .digit(digit0), .roll(roll));
    bcd_digit u1 (.clk(clk_div), .rst_n(rst_n), .dir(dir), .en(roll),  .digit(digit1), .roll());
endmodule
