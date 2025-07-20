`timescale 1ns / 1ps

module clock_divider(
        input CLK, 
        output reg [31:0] cnt = 0
    );
    always @(posedge CLK)
        cnt <= cnt + 1;
endmodule