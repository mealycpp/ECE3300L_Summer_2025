module
seg7_scan_tb(
);
reg clk;
    reg rst_n;
    reg [3:0] dig0;
    reg [3:0] dig1;
    reg [3:0] dig2;
    wire [7:0] an;
    wire [6:0] seg;
    
    seg7_scan uut(
    .rst_n(rst_n),
    .dig0(dig0),
    .dig1(dig1),
    .dig2(dig2),
    .an(an),
    .seg(seg)
    );
    
    integer i,j,k;
    //set initial conditions for clock and reset
    initial begin 
    clk = 0;
    rst_n = 0;
    #30;
    rst_n = 1;
    end
    //clock signal
    always #5 clk =~ clk;
    
    initial begin 
    dig0 = 4'd0;
    for (i = 0; i < 10; i = i + 1) begin
    #10;
    dig0 = i;
    end
    end
    
    initial begin 
    dig1 = 4'd0;
    for (j = 0; j < 10; j = j + 1) begin
    #10;
    dig1 = j;
    end
    end
    
    initial begin 
    dig2 = 4'd0;
    for (k = 0; k < 10; k = k + 1) begin
    #10;
    dig2 = k;
    end
    #120;
    $finish;
    end
    endmodule