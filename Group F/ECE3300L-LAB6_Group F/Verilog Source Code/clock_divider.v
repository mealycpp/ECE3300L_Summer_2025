module clock_divider (
    input wire clk,                 // 100 MHz input clock
    input wire [4:0] sel,           // SW[4:0] selects division speed
    output wire clk_div             // Output divided clock
);
    reg [31:0] count = 0;

    always @(posedge clk) begin
        count <= count + 1;
    end

    assign clk_div = count[sel];
endmodule
