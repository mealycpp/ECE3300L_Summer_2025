module bcd_up_down_counter(
    input wire clk_processed,
    input wire rst_n,
    input wire dir,             
    output reg [3:0] digit
);

    always @(posedge clk_processed or negedge rst_n) begin
        if (!rst_n) begin
            digit <= 4'd0;
        end else begin
            if (dir) begin
                // Count up
                if (digit == 4'd9)
                    digit <= 4'd0;
                else
                    digit <= digit + 4'd1;
            end else begin
                // Count down
                if (digit == 4'd0)
                    digit <= 4'd9;
                else
                    digit <= digit - 4'd1;
            end
        end
    end

endmodule
