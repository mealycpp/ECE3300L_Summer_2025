`timescale 1ns / 1ps

module clock_divider(
    input clockIn,
    input [4:0] sel, 
    input rst_n, 
    output clk_div
    
    );
    
    reg [31:0] counter;
    
    always @(posedge clockIn or negedge rst_n) begin
        if (!rst_n)
            counter <= 32'b0;    
        else
            counter <= counter + 1; 
    end
    
    assign clk_div = counter[31 - sel];
    
endmodule
