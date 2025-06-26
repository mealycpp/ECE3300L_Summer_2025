`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Student Daniel and Student Kobe
// 
// Create Date: 06/22/2025 10:18:35 PM
// Design Name: 
// Module Name: tb_decoder4x16
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


module tb_decoder4x16( );
    reg [3:0] A_tb; 
    reg [4:4] E_tb;
    wire [15:0] Y_tb;
     
    decoder4x16_behav TEST ( .E(E_tb), .A(A_tb), .Y(Y_tb) );
    
    initial
        begin: testCase1
            E_tb = 4'b0001; //Enable is on
            
            A_tb = 4'b0000; //A = 0000
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[0] == 1)
                $display("PASS0");
                else
                $fatal (1, "FAIL0");
    
            A_tb = 4'd1; //4 bit of Decimal format, value 1
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[1] == 1)
                $display("PASS1");
                else
                $fatal (1, "FAIL1");
            
            A_tb = 4'b0010;
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[2] == 1)
                $display("PASS2");
                else
                $fatal (1, "FAIL2");
           
            A_tb = 4'd3;
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[3] == 1)
                $display("PASS3");
                else
                $fatal (1, "FAIL3");
                
            A_tb = 4'd4;
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[4] == 1)
                $display("PASS4");
                else
                $fatal (1, "FAIL4");
               
            A_tb = 4'd5;
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[5] == 1)
                $display("PASS5");
                else
                $fatal (1, "FAIL5");
                
            A_tb = 4'd6;
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[6] == 1)
                $display("PASS6");
                else
                $fatal (1, "FAIL6");
                
            A_tb = 4'd7;
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[7] == 1)
                $display("PASS7");
                else
                $fatal (1, "FAIL7");
                
            A_tb = 4'd8;
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[8] == 1)
                $display("PASS8");
                else
                $fatal (1, "FAIL8");
                
           A_tb = 4'd9;
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[9] == 1)
                $display("PASS9");
                else
                $fatal (1, "FAIL9");
           
            A_tb = 4'd10;
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[10] == 1)
                $display("PASS10");
                else
                $fatal (1, "FAIL10");
                
            A_tb = 4'd11;
             #10 //10 nanoSeconds have passed in the simulation
             if(Y_tb[11] == 1)
                 $display("PASS11");
                 else
                 $fatal (1, "FAIL11");
                 
            A_tb = 4'd12;
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[12] == 1)
                $display("PASS12");
                else
                $fatal (1, "FAIL12");
                
           A_tb = 4'd13;
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[13] == 1)
                $display("PASS13");
                else
                $fatal (1, "FAIL13");
                
           A_tb = 4'd14;
            #10 //10 nanoSeconds have passed in the simulation
            if(Y_tb[14] == 1)
                $display("PASS14");
                else
                $fatal (1, "FAIL14");
                
           A_tb = 4'd15;
             #10 //10 nanoSeconds have passed in the simulation
             if(Y_tb[15] == 1)
                 $display("PASS15");
                 else
                 $fatal (1, "FAIL15");
                 
        #10 //10 nanoSeconds have passed in the simulation
        
        E_tb = 4'b0000; //Enable is off
        
        #10 //10 nanoSeconds have passed in the simulation
    
        $finish; //NEEDED to terminate the Simulation
        end
        
endmodule
