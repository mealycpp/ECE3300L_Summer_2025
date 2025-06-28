`timescale 1ns / 1ps

module decoder4x16_behav (
    input  wire [3:0] SW,    // Slide switches SW3..SW0
    input  wire       EN,    // Enable switch SW4
    output reg  [15:0] LED   // LEDs LED0..LED15
);

    always @(*) begin
        LED = 16'b0;         // reset all LEDs to 0 
        if (EN) begin       // only decode when enabled
            case (SW)
                4'b0000: LED = 16'b0000_0000_0000_0001; // LED0 on 
                4'b0001: LED = 16'b0000_0000_0000_0010; // LED1 on
                4'b0010: LED = 16'b0000_0000_0000_0100; // LED2 on
                4'b0011: LED = 16'b0000_0000_0000_1000; // LED3 on
                4'b0100: LED = 16'b0000_0000_0001_0000; // LED4 on
                4'b0101: LED = 16'b0000_0000_0010_0000; // LED5 on
                4'b0110: LED = 16'b0000_0000_0100_0000; // LED6 on
                4'b0111: LED = 16'b0000_0000_1000_0000; // LED7 on
                4'b1000: LED = 16'b0000_0001_0000_0000; // LED8 on
                4'b1001: LED = 16'b0000_0010_0000_0000; // LED9 on
                4'b1010: LED = 16'b0000_0100_0000_0000; // LED10 on
                4'b1011: LED = 16'b0000_1000_0000_0000; // LED11 on
                4'b1100: LED = 16'b0001_0000_0000_0000; // LED12 on
                4'b1101: LED = 16'b0010_0000_0000_0000; // LED13 on
                4'b1110: LED = 16'b0100_0000_0000_0000; // LED14 on
                4'b1111: LED = 16'b1000_0000_0000_0000; // LED15 on
                default: LED = 16'b0;
            endcase
        end
    end

endmodule
