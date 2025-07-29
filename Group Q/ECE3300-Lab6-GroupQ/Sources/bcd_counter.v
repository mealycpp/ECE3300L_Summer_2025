
module bcd_counter(
    input clk_div,
    input rst_n,           // Active-low reset (BTN0)
    input dir_bit,         // 1 = count up, 0 = count down (SW [8:7])
    output reg [3:0] digit // Ones digit in BCD


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
