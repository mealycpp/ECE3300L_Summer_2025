module bcd_up_down_counter(
    input wire clk,
    input wire rst_n,
    input wire dir,             
    output reg [3:0] digit0,
    output reg [3:0] digit1
);

    always @(posedge clk or negedge rst_n) // increment Logic
		begin
			if (!rst_n) 
				begin
					digit0 <= 0; // Reset sets BCD values back to 0 no matter state
					digit1 <= 0;
				end 
			else if (dir) // dir == 1 , increase : dir == 0, decrease: controlled by toggle on top module
				begin  
					if (digit0 == 9) 
						begin
							digit0 <= 0;
							if (digit1 == 9)
								digit1 <= 0;
							else
								digit1 <= digit1 + 1;
						end 
					else 
						digit0 <= digit0 + 1;
				end 
			else 
				begin  
					if (digit0 == 0) 
						begin
							digit0 <= 9;
							if (digit1 == 0)
								digit1 <= 9;
							else
								digit1 <= digit1 - 1;
						end 
					else 
						digit0 <= digit0 - 1;
				end
		end
		
endmodule
