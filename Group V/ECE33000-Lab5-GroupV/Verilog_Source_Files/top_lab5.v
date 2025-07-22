module top_lab5(
    input clk,          // 100MHz
    input rst_n,        // BTN0 (active low)
    input dir,          // BTN1 (1=up, 0=down)
    input [4:0] sw,     // Speed select
    output [7:0] an,    // 7-seg anodes
    output [6:0] seg,   // 7-seg segments
    output [7:0] led    // LED output
);
    wire [31:0] cnt;
    wire clk_div;
    wire [4:0] notsw = ~sw;


    // Clock Divider
    clock_divider u_div(.clk(clk), .rst_n(rst_n), .cnt(cnt));

    // MUX for speed select
    mux32x1 u_mux(.cnt(cnt), .sel(notsw), .clk_out(clk_div));

    // BCD Up/Down Counter
    wire [3:0] units, tens;
    bcd_up_down_counter u_bcd(.clk(clk_div), .rst_n(rst_n), .dir(dir),
                               .units(units), .tens(tens), .leds(led));

    // 7-segment scan
    seg7_scan u_seg(.clk(cnt[15]), .rst_n(rst_n), .units(units), .tens(tens),
                    .an(an), .seg(seg));
endmodule