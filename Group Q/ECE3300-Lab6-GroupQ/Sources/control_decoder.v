module control_decoder(
  input [3:0] controlSW, // {SW [8-5]} 
    output reg [3:0] ctrl_nibble
    );

    always@(*)begin
        ctrl_nibble = controlSW;
    end

endmodule
