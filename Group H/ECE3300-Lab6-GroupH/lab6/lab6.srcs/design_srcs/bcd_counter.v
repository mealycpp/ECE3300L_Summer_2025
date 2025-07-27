`timescale 1ns / 1ps

module bcd_counter(
    input clk_div,         
    input rst_n,         
    input dir_bit,     
    output reg [3:0] digit 

    );
    
    
    always@(posedge clk_div or negedge rst_n) begin
        if (!rst_n) begin
            digit <= 4'b0 ;
            end
        else begin 
          if (!dir_bit) begin
            if (digit == 4'd9) begin   
            digit <= 4'd0;
            end
            else
            digit <= digit + 1;
            end
          else begin
            if (digit == 4'd0) begin
            digit <= 4'd9;
            end
            else
            digit <= digit - 1;
            end
            
         end
        end
        
endmodule
