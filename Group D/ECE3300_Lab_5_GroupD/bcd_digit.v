//bryan

module bcd_digit (
    input clk, rst_n, dir, en,
    output reg [3:0] digit,
    output reg roll
);
    reg [3:0] next;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            digit <= 0;
            roll <= 0;
        end else if (en) begin
            if (dir) begin // up
                if (digit == 9) begin digit <= 0; roll <= 1; end
                else begin digit <= digit + 1; roll <= 0; end
            end else begin // down
                if (digit == 0) begin digit <= 9; roll <= 1; end
                else begin digit <= digit - 1; roll <= 0; end
            end
        end else roll <= 0;
    end
endmodule
