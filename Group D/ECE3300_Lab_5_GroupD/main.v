//bryan

module main (
    input clk,
    input [4:0] sw,
    input btn0, btn1,
    output [6:0] seg,
    output [1:0] an,
    output [7:0] led
);
    wire [31:0] cnt;
    wire clk_div;
    wire [3:0] d0, d1;

    clock_divider u_div (.clk(clk), .cnt(cnt));
    mux32x1 u_mux (.cnt(cnt), .sel(sw), .clk_div(clk_div));
    bcd_up_down_counter u_counter (
        .clk_div(clk_div), .rst_n(btn0), .dir(btn1),
        .digit0(d0), .digit1(d1)
    );
    seg7_scan u_scan (.clk(clk), .digit0(d0), .digit1(d1), .seg(seg), .an(an));

    assign led[4:0] = sw;
    assign led[7:5] = d1[2:0]; // only 3 bits from tens shown

endmodule
