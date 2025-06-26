`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Jared Mocling and Kevin Tang
// 
// Create Date: 06/25/2025 05:24:19 PM
// Design Name: testing 4x16 decoder
// Module Name: testben_decoder4x16
// Project Name: ECE 3300 Lab 2
// Target Devices: NEXYS A7-100T FPGA
// Tool Versions: Vivado 2025.1
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testben_decoder4x16();
   reg [3:0] SW_tb;
    reg [4:4] EN_tb;
    wire [15:0] Y_tb;
     
    decoder4x16_behav TEST ( .EN(EN_tb), .SW(SW_tb), .Y(Y_tb) );
    
    initial
        begin: testCase1
            EN_tb = 4'b0001; //Enable is on
            
            SW_tb = 4'b0000; //A = 0000
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[0] == 1)
                $display("Passed0");
                else
                $fatal (1, "Fail0");
    
            SW_tb = 4'd1; //4 bit of Decimal format, value 1
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[1] == 1)
                $display("Passed1");
                else
                $fatal (1, "Failed1");
            
            SW_tb = 4'b0010;
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[2] == 1)
                $display("Passed2");
                else
                $fatal (1, "Failed2");
           
            SW_tb = 4'd3;
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[3] == 1)
                $display("Passed3");
                else
                $fatal (1, "Failed3");
                
            SW_tb = 4'd4;
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[4] == 1)
                $display("Passed4");
                else
                $fatal (1, "Failed4");
               
            SW_tb = 4'd5;
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[5] == 1)
                $display("Passed5");
                else
                $fatal (1, "Failed5");
                
            SW_tb = 4'd6;
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[6] == 1)
                $display("Passed6");
                else
                $fatal (1, "Failed6");
                
            SW_tb = 4'd7;
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[7] == 1)
                $display("Passed7");
                else
                $fatal (1, "Failed7");
                
            SW_tb = 4'd8;
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[8] == 1)
                $display("Passed8");
                else
                $fatal (1, "Failed8");
                
           SW_tb = 4'd9;
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[9] == 1)
                $display("Passed9");
                else
                $fatal (1, "Failed9");
           
            SW_tb = 4'd10;
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[10] == 1)
                $display("Passed10");
                else
                $fatal (1, "Failed10");
                
            SW_tb = 4'd11;
             #10 //10 nanoSeconds have passed in the simulation
             if(Y_tb[11] == 1)
                 $display("Passed11");
                 else
                 $fatal (1, "Failed11");
                 
            SW_tb = 4'd12;
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[12] == 1)
                $display("Passed12");
                else
                $fatal (1, "Failed12");
                
           SW_tb = 4'd13;
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[13] == 1)
                $display("Passed13");
                else
                $fatal (1, "Failed13");
                
           SW_tb = 4'd14;
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[14] == 1)
                $display("Passed14");
                else
                $fatal (1, "Failed14");
                
           SW_tb = 4'd15;
             #10 //10 nanoSeconds have passed in the simulation
             if(Y_tb[15] == 1)
                 $display("Passed15");
                 else
                 $fatal (1, "Failed15");
                 
        #10 //10 nanoSeconds have passed in the simulation
        
        EN_tb = 4'b0000; //Enable is off
        
        #10 //10 nanoSeconds have passed in the simulation
    
        $finish; //Needed to terminate the simulation
        end

endmodule
