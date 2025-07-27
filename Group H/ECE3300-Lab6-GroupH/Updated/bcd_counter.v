`timescale 1ns / 1ps
module bcd_counter(
    input clk_div,         
    input rst_n,           // Active-low reset (BTN0)
    input dir_bit,         // 1 = count up, 0 = count down (SW [8:7])
    output reg [3:0] digit // Ones digit in BCD
    //output reg pulse  // pulse on overFlow/underFlow

    );
    
    
    always@(posedge clk_div or negedge rst_n) begin
       // pulse = 0;
        if (!rst_n) begin
            digit <= 4'b0 ;
            end
        else begin 
          if (!dir_bit) begin
            if (digit == 4'd9) begin      // If at 9, wrap to 0
            digit <= 4'd0;
           // pulse = 1;
            end
            else
            digit <= digit + 1;
            end
          else begin
            if (digit == 4'd0) begin      // If at 0, wrap to 9
            digit <= 4'd9;
            //pulse = 1;
            end
            else
            digit <= digit - 1;
            end
            
         end
        end
        
endmodule
