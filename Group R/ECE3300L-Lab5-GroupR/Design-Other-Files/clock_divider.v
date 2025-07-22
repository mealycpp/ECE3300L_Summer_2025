module clock_divider(
    input CLK,              // System clock input
    input rst_n,            // Active-low reset
    output [31:0] counter   // 32-bit output counter value
);

    reg [31:0] tmp;         // Internal register to hold count value

    // Counter logic: increments on every rising clock edge
    always @(posedge CLK) begin 
        if (!rst_n) 
            tmp <= 32'd0;   // Synchronous reset: clear counter when reset is low
        else
            tmp <= tmp + 1; // Otherwise, increment counter
    end

    assign counter = tmp;   // Output current counter value

endmodule
