`timescale 1ns/1ps
/******************************************************************************
 * 8-digit 7-segment hexadecimal display driver
 * - Expects a 32-bit bus: eight 4-bit nibbles → eight digits
 * - Internally divides the 100 MHz clock so each digit refreshes fast enough
 * - Active-low outputs for the Nexys A7 common-anode display
 ******************************************************************************/
module seg7_driver
(
    input  wire        clk,
    input  wire        rst_n,
    input  wire [31:0] SW,
    output reg  [6:0]  Cnode,
    output wire        dp,
    output wire [7:0]  AN
);

    /* --------------------------------------------------------------------- */
    /* Lookup-table: 4-bit hex → 7-segment pattern (active-low)             */
    /* --------------------------------------------------------------------- */
    reg [3:0] digit;
    always @* begin
        case (digit)
            4'h0: Cnode = 7'b0000001;
            4'h1: Cnode = 7'b1001111;
            4'h2: Cnode = 7'b0010010;
            4'h3: Cnode = 7'b0000110;
            4'h4: Cnode = 7'b1001100;
            4'h5: Cnode = 7'b0100100;
            4'h6: Cnode = 7'b0100000;
            4'h7: Cnode = 7'b0001111;
            4'h8: Cnode = 7'b0000000;
            4'h9: Cnode = 7'b0001100;
            4'hA: Cnode = 7'b0001000;
            4'hB: Cnode = 7'b1100000;
            4'hC: Cnode = 7'b0110001;
            4'hD: Cnode = 7'b1000010;
            4'hE: Cnode = 7'b0110000;
            4'hF: Cnode = 7'b0111000;
            default: Cnode = 7'b1111111;
        endcase
    end

    /* --------------------------------------------------------------------- */
    /* Clock divider → ~95 Hz digit refresh                                  */
    /* --------------------------------------------------------------------- */
    reg [19:0] tmp;
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            tmp <= 20'd0;
        else
            tmp <= tmp + 20'd1;

    wire [2:0] s = tmp[19:17];   // selects one of eight digits

    /* --------------------------------------------------------------------- */
    /* Multiplexer: choose nibble for current digit                          */
    /* --------------------------------------------------------------------- */
    always @* begin
        case (s)
            3'd0: digit = SW[ 3: 0];
            3'd1: digit = SW[ 7: 4];
            3'd2: digit = SW[11: 8];
            3'd3: digit = SW[15:12];
            3'd4: digit = SW[19:16];
            3'd5: digit = SW[23:20];
            3'd6: digit = SW[27:24];
            3'd7: digit = SW[31:28];
            default: digit = 4'h0;
        endcase
    end

    /* --------------------------------------------------------------------- */
    /* Generate active-low anode enable lines                                */
    /* --------------------------------------------------------------------- */
    reg [7:0] AN_tmp;
    always @* begin
        case (s)
            3'd0: AN_tmp = 8'b1111_1110;
            3'd1: AN_tmp = 8'b1111_1101;
            3'd2: AN_tmp = 8'b1111_1011;
            3'd3: AN_tmp = 8'b1111_0111;
            3'd4: AN_tmp = 8'b1110_1111;
            3'd5: AN_tmp = 8'b1101_1111;
            3'd6: AN_tmp = 8'b1011_1111;
            3'd7: AN_tmp = 8'b0111_1111;
            default: AN_tmp = 8'hFF;
        endcase
    end
    assign AN = AN_tmp;

    /* --------------------------------------------------------------------- */
    /* Decimal point disabled (high)                                         */
    /* --------------------------------------------------------------------- */
    assign dp = 1'b1;

endmodule
