`timescale 1ns / 1ps

module clock_divider( 
                     input wire clk,
                     input wire reset_n,
                     input wire [4:0] sel,
                     output wire clk_div,
                     output reg [31:0] counter
                    );
                    
                    always@(posedge clk or negedge reset_n) begin
                        if (!reset_n)
                            counter <= 32'b0;
                        else
                            counter <= counter + 1;
                    end
                    
                    assign clk_div = counter [sel];
 
endmodule
