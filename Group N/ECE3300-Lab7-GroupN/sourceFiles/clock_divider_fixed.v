module clock_divider_fixed(
     input clockIn,
     input rst_n, // active-low resert 
     
     output reg clk_div1,
     output reg clk_div2
    );
    
    // we can find the value below by 100Mhz / 1kHz = 100,000 cycles for full period
    // but we want toggle at half cycle so 100,000 / 2 = 50,000 
    parameter DIV_VALUE1 = 16'd50_000;  // divide 100 Mhz to 1 khz, this will toggle each 50,000 cycles
    
    parameter DIV_VALUE2 = 8'd250;  // converts 1kHz to 2Hz, 8 bits for 0-255
    
    reg [31:0] count1;
    reg [31:0] count2;
    
    always @(posedge clockIn or negedge rst_n) 
        begin
            if (!rst_n)
                begin
                    count1 <= 32'b0;     // reset the counter
                    clk_div1 <= 1'b0;    // reset clk_div
                end
            else
            begin
                if (count1 == DIV_VALUE1 - 1)
                begin
                    count1 <= 32'b0;
                    clk_div1 <= ~clk_div1;   // toggle
                end
                else
                begin
                    count1 <= count1 + 1; // increment count on rising edge 
                    clk_div1 <= clk_div1;
                end
            end        
        end
    
        // start of the second counter
        always @(posedge clk_div1 or negedge rst_n) 
        begin
            if (!rst_n)
                begin
                    count2 <= 32'b0;     // reset the counter
                    clk_div2 <= 1'b0;    // reset clk_div
                end
            else
            begin
                if (count2 == DIV_VALUE2 - 1)
                begin
                    count2 <= 32'b0;
                    clk_div2 <= ~clk_div2;   // toggle
                end
                else
                begin
                    count2 <= count2 + 1; // increment count2 on rising edge 
                    clk_div2 <= clk_div2;
                end
            end        
        end
    
    
endmodule
