`timescale 1ns / 1ps

module clock_divider(
    input clk,        
    input rst_n,       
    input [4:0] sel,    
    output clk_div      
    );

    reg [31:0] counter;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            counter <= 32'd0;
        else
            counter <= counter + 1;
    end

    assign clk_div = counter[sel];

endmodule