`timescale 1ns / 1ps

module clock_divider(
    input clockIn,
    input [4:0] sel, // speed selector 0-31), 0 being slowest, this will use SW[4:0]
    input rst_n, // active-low resert 
    output clk_div
    
    );
    
    reg [31:0] counter;
    
    always @(posedge clockIn or negedge rst_n) begin
        if (!rst_n)
            counter <= 32'b0;     // Reset the counter
        else
            counter <= counter + 1;   // Increment on each rising clock edge
    end
    
    assign clk_div = counter[31 - sel]; // without 31 - : this would be inverted on the physical switches
    
endmodule
