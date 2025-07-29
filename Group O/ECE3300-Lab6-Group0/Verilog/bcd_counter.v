module bcd_counter(
    input clk_div,
    input BTN0,
    input dir_bit,
    output reg [3:0] BCD
);
    always @(posedge clk_div or negedge BTN0) begin
        if (!BTN0) BCD <= 4'd0;
        else if (dir_bit) BCD <= (BCD == 4'd9) ? 4'd0 : BCD + 4'd1;
        else BCD <= (BCD == 4'd0) ? 4'd9 : BCD - 4'd1;
    end
endmodule