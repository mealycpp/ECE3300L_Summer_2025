module seg7_scan(
    input clk,
    input rst_n,
    input [3:0] units,
    input [3:0] tens,
    output reg [7:0] an,
    output reg [6:0] seg
);
    reg select;
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            select <= 0;
        else
            select <= ~select; // Toggle between digits
    end

    always @(*) begin
        case (select)
            0: begin
                an = 8'b11111110; // enable units digit (AN0 active low)
                seg = bcd_to_7seg(units);
            end
            1: begin
                an = 8'b11111101; // enable tens digit (AN1 active low)
                seg = bcd_to_7seg(tens);
            end
            default: begin 
                an = 8'b11111111;
                //seg = bcd_to_7seg(7'd1111111);
            end
        endcase
    end

    function [6:0] bcd_to_7seg(input [3:0] bcd);
        case (bcd)
            4'd0: bcd_to_7seg = 7'b1000000;
            4'd1: bcd_to_7seg = 7'b1111001;
            4'd2: bcd_to_7seg = 7'b0100100;
            4'd3: bcd_to_7seg = 7'b0110000;
            4'd4: bcd_to_7seg = 7'b0011001;
            4'd5: bcd_to_7seg = 7'b0010010;
            4'd6: bcd_to_7seg = 7'b0000010;
            4'd7: bcd_to_7seg = 7'b1111000;
            4'd8: bcd_to_7seg = 7'b0000000;
            4'd9: bcd_to_7seg = 7'b0010000;
            default: bcd_to_7seg = 7'b1111111; // blank
        endcase
    endfunction
endmodule