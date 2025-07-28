`timescale 1ns / 1ps


module clock_divider(
    input clk,                  // 100 MHz
    input [4:0] sw,            // SW[4:0]
    output clk_div              // selected bit
    );
    
    reg [31:0] counter ;

    always @(posedge clk)
        counter <= counter + 1;

    assign clk_div = counter[sw];  // Select 1 of 32 bits
    
endmodule
