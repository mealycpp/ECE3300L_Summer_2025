module control_decoder(
input clk_div,
input BTN0,
input [3:0] SW,
output reg [3:0] ctrl_nibble
);
always @(posedge clk_div or negedge BTN0) begin
    if (!BTN0)
      ctrl_nibble <= 4'b0;
    else
      ctrl_nibble <= SW;
  end
endmodule