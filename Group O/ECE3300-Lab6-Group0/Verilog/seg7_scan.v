module seg7_scan(
    input clk,
    input BTN0,
    input [3:0] digit0, digit1, digit2,
    output reg [6:0] SEG,
    output reg [7:0] AN
);
    reg [19:0] refresh_counter;

    always @(posedge clk or negedge BTN0) begin
        if (!BTN0) refresh_counter <= 20'd0;
        else refresh_counter <= refresh_counter + 1;
    end

    wire [1:0] sel = refresh_counter[19:18];
    reg [3:0] current_digit;

    always @(*) begin
        case (sel)
            2'b00: begin 
                AN = 8'b11111110; 
                current_digit = digit0;
            end
            2'b01: begin 
                AN = 8'b11111101; 
                current_digit = digit1;
            end
            2'b10: begin 
                AN = 8'b11111011; 
                current_digit = digit2;
            end
            default: begin 
                AN = 8'b11111111; 
                current_digit = 4'd0;
            end
        endcase

        case (current_digit)
            4'h0: SEG = 7'b1000000;
            4'h1: SEG = 7'b1111001;
            4'h2: SEG = 7'b0100100;
            4'h3: SEG = 7'b0110000;
            4'h4: SEG = 7'b0011001;
            4'h5: SEG = 7'b0010010;
            4'h6: SEG = 7'b0000010;
            4'h7: SEG = 7'b1111000;
            4'h8: SEG = 7'b0000000;
            4'h9: SEG = 7'b0010000;
            4'hA: SEG = 7'b0001000;
            4'hB: SEG = 7'b0000011;
            4'hC: SEG = 7'b1000110;
            4'hD: SEG = 7'b0100001;
            4'hE: SEG = 7'b0000110;
            4'hF: SEG = 7'b0001110;
            default: SEG = 7'b1111111;
        endcase
    end
endmodule