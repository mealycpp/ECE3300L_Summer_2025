`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2025 11:11:31 PM
// Design Name: 
// Module Name: lab3_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab3_tb(

    );
    
    reg rst_tb;
    reg clk_tb;
    reg [15:0] SW_tb;
    reg btnU_tb;
    reg btnD_tb;
    reg btnR_tb;
    reg btnL_tb;
    wire LED0_tb;
    
    initial
        begin
            clk_tb = 1;
        end
        
     always
        begin
            #5 clk_tb = clk_tb + 5;
        end  
        
            top_mux_lab3 X (
    .clk(clk_tb),
    .rst(rst_tb),
    .SW(SW_tb),
    .btnU(btnU_tb),
    .btnD(btnD_tb),
    .btnR(btnR_tb),
    .btnL(btnL_tb),
    .LED0(LED0_tb)
    );
    
     initial
        begin
            rst_tb = 1'b1;
            SW_tb = 16'b1111_1111_1111_1111;
        #50
            rst_tb = 1'b0;
            btnD_tb = 1'b0; 
            btnR_tb = 1'b0;
            btnL_tb = 1'b0;
            btnU_tb = 1'b0;                    
            if (LED0_tb === SW_tb[0])
            $display("PASS: LED0 = %b matches SW[0] = %b", LED0_tb, SW_tb[0]);
        #50
            btnD_tb = 1'b0; 
            btnR_tb = 1'b0;
            btnL_tb = 1'b0;
            btnU_tb = 1'b1;                    
            if (LED0_tb === SW_tb[1])
            $display("PASS: LED0 = %b matches SW[1] = %b", LED0_tb, SW_tb[1]); 
        #50
            btnD_tb = 1'b0; 
            btnR_tb = 1'b0;
            btnL_tb = 1'b1;
            btnU_tb = 1'b0;                     
            if (LED0_tb === SW_tb[2])
            $display("PASS: LED0 = %b matches SW[2] = %b", LED0_tb, SW_tb[2]);
        #50
            btnD_tb = 1'b0; 
            btnR_tb = 1'b0;
            btnL_tb = 1'b1;
            btnU_tb = 1'b1;                     
            if (LED0_tb === SW_tb[3])
            $display("PASS: LED0 = %b matches SW[3] = %b", LED0_tb, SW_tb[3]);
        #50
            btnD_tb = 1'b0; 
            btnR_tb = 1'b1;
            btnL_tb = 1'b0;
            btnU_tb = 1'b0;                     
            if (LED0_tb === SW_tb[4])
            $display("PASS: LED0 = %b matches SW[4] = %b", LED0_tb, SW_tb[4]);
        #50
            btnD_tb = 1'b0; 
            btnR_tb = 1'b1;
            btnL_tb = 1'b0;
            btnU_tb = 1'b1;                     
            if (LED0_tb === SW_tb[5])
            $display("PASS: LED0 = %b matches SW[5] = %b", LED0_tb, SW_tb[5]);
        #50
            btnD_tb = 1'b0; 
            btnR_tb = 1'b1;
            btnL_tb = 1'b1;
            btnU_tb = 1'b0;                     
            if (LED0_tb === SW_tb[6])
            $display("PASS: LED0 = %b matches SW[6] = %b", LED0_tb, SW_tb[6]);
        #50
            btnD_tb = 1'b0; 
            btnR_tb = 1'b1;
            btnL_tb = 1'b1;
            btnU_tb = 1'b1;                    
            if (LED0_tb === SW_tb[7])
            $display("PASS: LED0 = %b matches SW[7] = %b", LED0_tb, SW_tb[7]); 
        #50
            btnD_tb = 1'b1; 
            btnR_tb = 1'b0;
            btnL_tb = 1'b0;
            btnU_tb = 1'b0;                     
            if (LED0_tb === SW_tb[8])
            $display("PASS: LED0 = %b matches SW[8] = %b", LED0_tb, SW_tb[8]);
        #50
            btnD_tb = 1'b1; 
            btnR_tb = 1'b0;
            btnL_tb = 1'b0;
            btnU_tb = 1'b1;                     
            if (LED0_tb === SW_tb[9])
            $display("PASS: LED0 = %b matches SW[9] = %b", LED0_tb, SW_tb[9]);
        #50
            btnD_tb = 1'b1; 
            btnR_tb = 1'b0;
            btnL_tb = 1'b1;
            btnU_tb = 1'b0;                     
            if (LED0_tb === SW_tb[10])
            $display("PASS: LED0 = %b matches SW[10] = %b", LED0_tb, SW_tb[10]);
        #50
            btnD_tb = 1'b1; 
            btnR_tb = 1'b0;
            btnL_tb = 1'b1;
            btnU_tb = 1'b1;                    
            if (LED0_tb === SW_tb[11])
            $display("PASS: LED0 = %b matches SW[11] = %b", LED0_tb, SW_tb[11]); 
        #50
            btnD_tb = 1'b1; 
            btnR_tb = 1'b1;
            btnL_tb = 1'b0;
            btnU_tb = 1'b0;                     
            if (LED0_tb === SW_tb[12])
            $display("PASS: LED0 = %b matches SW[12] = %b", LED0_tb, SW_tb[12]);
        #50
            btnD_tb = 1'b1; 
            btnR_tb = 1'b1;
            btnL_tb = 1'b0;
            btnU_tb = 1'b1;                     
            if (LED0_tb === SW_tb[13])
            $display("PASS: LED0 = %b matches SW[13] = %b", LED0_tb, SW_tb[13]);
        #50
            btnD_tb = 1'b1; 
            btnR_tb = 1'b1;
            btnL_tb = 1'b1;
            btnU_tb = 1'b0;                     
            if (LED0_tb === SW_tb[14])
            $display("PASS: LED0 = %b matches SW[14] = %b", LED0_tb, SW_tb[14]);
        #50
            btnD_tb = 1'b1; 
            btnR_tb = 1'b1;
            btnL_tb = 1'b1;
            btnU_tb = 1'b1;
            if (LED0_tb === SW_tb[15])
            $display("PASS: LED0 = %b matches SW[15] = %b", LED0_tb, SW_tb[15]);
        #50
            $display("Success.");
            $finish;
        end
             
endmodule
