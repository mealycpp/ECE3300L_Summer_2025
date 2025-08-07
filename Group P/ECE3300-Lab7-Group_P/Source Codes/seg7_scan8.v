// seg7_scan8.v
module seg7_scan8(
    input wire clk,                                     // clk
    input wire rst,                                     // rst
    input wire [15:0] data,                             // 16-bit data input
    output wire [6:0] seg,                              // Segment output
    output reg [7:0] an                                 // Anode signals
);
    reg [2:0] scan;                                     // 3-bit scan counte
    wire [3:0] nibble;                                  // 4-bit value for current digit

    assign nibble = (scan == 3'd0) ? data[3:0] :        // AN0 (display 1)
                    (scan == 3'd1) ? data[7:4] :        // AN1 (display 2)
                    (scan == 3'd2) ? data[11:8] :       // AN2 (display 3)
                    (scan == 3'd3) ? data[15:12] :      // AN3 (display 4)
                    4'b0000;

    hex_to_7seg h2s(.hex(nibble), .seg(seg));

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            scan <= 3'd0;                               // Reset scan counter
            an <= 8'b11111111;                          // Disable all digits
        end else begin
            scan <= (scan == 3'd3) ? 3'd0 : scan + 1;
            case (scan)
                3'd0: an <= 8'b11111101;                // Enable AN0 (LSB)
                3'd1: an <= 8'b11111011;                // Enable AN1
                3'd2: an <= 8'b11110111;                // Enable AN2
                3'd3: an <= 8'b11111110;                // Enable AN3 (MSB)
                default: an <= 8'b11111111;             // All off
            endcase
        end
    end
endmodule