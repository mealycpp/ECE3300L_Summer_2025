module clock_divider(
    input CLK, 
    input rst_n, 
    output [31:0] counter
    );
    
    reg [31:0] tmp; 
    
    always @(posedge CLK) begin 
    if (!rst_n) 
        tmp <= 0; 
    else
        tmp <= tmp + 1; 
    end
    
    assign counter = tmp;
    
endmodule
