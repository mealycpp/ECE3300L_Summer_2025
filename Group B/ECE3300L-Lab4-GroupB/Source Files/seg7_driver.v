module seg7_driver(
    input clk,
    input rst,
    input [15:0] SW,
    output [6:0] Cnode,
    output dp,
    output [7:0] AN,
    output [15:0] LED
);

    assign dp = 1'b1;
    assign LED = SW;

    reg [19:0] tmp;
    wire [3:0] digit_wire;

    always @(posedge clk or posedge rst)
        if (rst) tmp <= 0;
        else tmp <= tmp + 1;

    wire [2:0] s = tmp[19:17];

    
    mux8 mux_inst (
        .SW(SW),
        .s(s),
        .digit(digit_wire)
    );

    
    seg7_decoder seg_inst (
        .digit(digit_wire),
        .Cnode(Cnode)
    );

    
    anode_decoder an_inst (
        .s(s),
        .AN_tmp(AN)
    );

endmodule
