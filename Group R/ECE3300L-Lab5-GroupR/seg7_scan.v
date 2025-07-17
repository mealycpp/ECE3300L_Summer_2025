`timescale 1ns / 1ps

module seg7_scan(
        output [1:0] AN, 
        output reg [6:0] SEG, 
        input [7:0] out, 
        input CLK, 
        input rst_n
    );
    
    reg [17:0] tmp;
    reg[3:0] digit;

    
    always@(digit) 
        case(digit)
            4'd0: SEG=7'b0000001; 
            4'd1: SEG=7'b1001111;
            4'd2: SEG=7'b0010010;
            4'd3: SEG=7'b0000110; 
            4'd4: SEG=7'b1001100; 
            4'd5: SEG=7'b0100100;
            4'd6: SEG=7'b0100000;
            4'd7: SEG=7'b0001111; 
            4'd8: SEG=7'b0000000;
            4'd9: SEG=7'b0001100;
            default: SEG = 7'b1111111; 
       endcase 
       
    always@(posedge CLK)
        if(!rst_n) tmp<=0;
        else tmp<=tmp+1;
    
   wire s = tmp[17];
   
    always@(s, out)
       case (s)
            1'd0:digit=out[3:0]; 
            1'd1:digit=out[7:4];
       endcase
       
   reg [1:0] AN_tmp;
        always@(s)
            case(s)
                1'd0:AN_tmp=2'b10;
                1'd1:AN_tmp=2'b01;
                default: AN_tmp = 2'b11; 
            endcase
    assign AN = AN_tmp;
endmodule
