
module top(
    input clk,
    input [15:0] SW,
    output [15:0] LED,
    output [6:0] Cnode,
    output dp,
    output [7:0] AN
);

    seg7_driver u0 (
        .clk(clk),
        .SW(SW),
        .LED(LED),
        .Cnode(Cnode),
        .dp(dp),
        .AN(AN)
    );

endmodule
