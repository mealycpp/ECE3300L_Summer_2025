module seg7_scan8(
    output reg [7:0] AN,          // Active-low anode control for 2-digit 7-seg display
    output reg [6:0] SEG,     // 7-segment display output (a-g)
    input wire  clk_1kHz,
    input wire [6:0] d0,
    input wire [6:0] d1,
    input wire [6:0] d2,
    input wire [6:0] d3,
    input wire [6:0] d4,
    input wire [6:0] d5,
    input wire [6:0] d6,
    input wire [6:0] d7
    );

    // ------------------------------
    // Digit selection
    // Chooses which digit to display based on 's'
    // ------------------------------
    reg [2:0] selects = 0;
    
    always @(posedge clk_1kHz)
         selects <= selects + 1'b1;
       
    // ------------------------------
    // Anode control logic (active-low)
    // Selects which digit is currently active
    // ------------------------------
    always @(selects)
        case(selects)
            3'd0: begin AN = 8'b11111110; SEG = d0; end // rightmost digit
            3'd1: begin AN = 8'b11111101; SEG = d1; end
            3'd2: begin AN = 8'b11111011; SEG = d2; end
            3'd3: begin AN = 8'b11110111; SEG = d3; end
            3'd4: begin AN = 8'b11101111; SEG = d4; end // blank
            3'd5: begin AN = 8'b11011111; SEG = d5; end // blank
            3'd6: begin AN = 8'b10111111; SEG = d6; end // blank
            3'd7: begin AN = 8'b01111111; SEG = d7; end // blank            
            default: begin AN = 8'hFF; SEG = d0; end // all off
        endcase
endmodule