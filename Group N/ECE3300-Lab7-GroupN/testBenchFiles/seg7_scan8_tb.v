module seg7_scan8_tb(

    );
    reg clk;
    reg [15:0] data;
    wire [7:0] AN;
    wire [6:0] Cnode;
    
    seg7_scan8 scanTB(clk, data, AN, Cnode);
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        data = 16'hFEFE;
        #45 data = 16'h0808;
    end
endmodule