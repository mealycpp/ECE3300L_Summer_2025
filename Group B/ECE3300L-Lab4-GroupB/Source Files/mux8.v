module mux8 (
    input [15:0] SW,
    input [2:0] s,
    output reg [3:0] digit
);
    always @(*) begin
        case(s)
            3'd0: digit = SW[3:0];
            3'd1: digit = SW[7:4];
            3'd2: digit = SW[11:8];
            3'd3: digit = SW[15:12];
            3'd4: digit = SW[3:0];    
            3'd5: digit = SW[7:4];
            3'd6: digit = SW[11:8];
            3'd7: digit = SW[15:12];
        endcase
    end
endmodule