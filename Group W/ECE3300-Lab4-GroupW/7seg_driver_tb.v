`timescale 1ns / 1ps

module seg7_driver_tb(

    );
    
    reg clk_tb, rst_n_tb;
    reg [15:0] SW_tb;
    wire [15:0] LED_tb;
    wire [6:0] Cnode_tb;
    wire dp_tb;
    wire [7:0] AN_tb;
    
    seg7_driver tb(
        .clk(clk_tb),
        .rst_n(rst_n_tb),
        .SW(SW_tb),
        .LED(LED_tb),
        .Cnode(Cnode_tb),
        .dp(dp_tb),
        .AN(AN_tb)
    );
    
    initial clk_tb = 0;
    always #5 clk_tb = ~clk_tb;
    
    task test_group(input [3:0] value, input integer group);
        begin
            SW_tb = 16'b0;
            
            case(group)
                0: SW_tb[3:0] = value;
                1: SW_tb[7:4] = value;
                2: SW_tb[11:8] = value;
                3: SW_tb[15:12] = value;
            endcase 
            
            #40;
            
            $display("SW[%0d:%0d] = %h, LED = %h, Cnode = %b, AN = %b",
                group*4+3, group*4, value, LED_tb, Cnode_tb, AN_tb);

        end
    endtask
    
    integer w,x,y,z;
    
    initial
        begin
            SW_tb = 16'b0;
            rst_n_tb = 1;
            #40
            rst_n_tb = 0;
            #40
            
            for(w = 0; w < 16; w = w + 1)
                begin
                    test_group(w, 0);
                end
                
            for(x = 0; x < 16; x = x + 1)
                begin
                    test_group(x, 1);
                end
                
            for(y = 0; y < 16; y = y + 1)
                begin
                    test_group(y, 2);
                end   
                
             for(z = 0; z < 16; z = z + 1)
                begin
                    test_group(z, 3);
                end                            
                
            $finish;

        end 

endmodule
