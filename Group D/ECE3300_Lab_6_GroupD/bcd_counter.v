//jaden

module bcd_counter(input clk, input rst_n, input dir, output reg [3:0] out);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            out <= 0;
        else if (dir)
            out <= (out == 9) ? 0 : out + 1;
        else
            out <= (out == 0) ? 9 : out - 1;
    end
endmodule
