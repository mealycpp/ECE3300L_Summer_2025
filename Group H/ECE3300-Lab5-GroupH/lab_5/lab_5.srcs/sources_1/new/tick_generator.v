`timescale 1ns/1ps
module tick_generator (
    input  wire        clk,       // 100 MHz
    input  wire        rst_n,     // active-low
    input  wire [4:0]  sw,        // slide-switch select
    output wire        tick       // one-cycle enable
);
    reg [31:0] ctr;
    always @(posedge clk or negedge rst_n)
        ctr <= !rst_n ? 32'd0 : ctr + 32'd1;

    wire [4:0] tap = 5'd31 - sw;

    reg tap_d1;
    always @(posedge clk) tap_d1 <= ctr[tap];

    assign tick =  ctr[tap] & ~tap_d1;   // rising-edge detect
endmodule