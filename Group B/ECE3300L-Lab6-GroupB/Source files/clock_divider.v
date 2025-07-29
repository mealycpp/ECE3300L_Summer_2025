module clock_divider(
    input clk,                  // 100 MHz input clock
    input rst_n,                // active-low reset
    input [4:0] sel,            // speed-select from SW[4:0]
    output reg [31:0] count,    // counter
    output clk_div              // clock output
);
    //counter
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            count <= 32'd0;
        else
            count <= count + 1;
    end

    //select one of the bits from counter
    assign clk_div = count[sel];
endmodule
