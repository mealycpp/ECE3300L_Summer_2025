`timescale 1ns / 1ps



module decoder4x16_tb;

    //Inputs
    reg [3:0] A;    🟦
    reg E;          🟦
    
    // Outputs  for gate module      
    wire [15:0] Y_gate;    🟩
    
    // Outputs for Behavior Module
    wire [15:0] Y_behav;     🟩
    
    //expected output value for each container (16)
    reg [15:0] expected_out;    🟩
    
    // gate level  
    decoder4x16_gate uut_gate (.A(A), .E(E), .Y(Y_gate)); 🟧
    
    // behavior
    decoder4x16_behav uut_behav ( .A(A), .E(E), .Y(Y_behav));   🟧 
    
    integer i;
    
    initial begin 
        $display("starting 4-to - 16 decoder testbench..");
        
        // for loop for when Enable is 0
        E=0;
        for (i=0; i<16; i=i+1) begin
        A=i;
        expected_out =16'b0;
        #10;
        check_outputs(); //calling the function to check each condition statement y output to its expected value.
    end 
    // Loop for E = 1
    E = 1;
    for (i = 0; i < 16; i = i + 1) begin
        A = i;
        expected_out = (16'b1 << i);
        #10;
        check_outputs();
    end

    $display("Testbench completed.");
    $finish;
 end 
 
   // condition task to verify each combination of inputs. 16 combinations 
    task check_outputs;
    begin
        if (Y_gate !== expected_out) begin
            $display("FAIL GATE: E=%b A=%b Y=%b expected=%b", E, A, Y_gate, expected_out);
        end 
        else begin
            $display("PASS GATE: E=%b A=%b Y=%b", E, A, Y_gate);
        end

        if (Y_behav !== expected_out) begin
            $display("FAIL BEHAV: E=%b A=%b Y=%b expected=%b", E, A, Y_behav, expected_out);
        end else begin
            $display("PASS BEHAV: E=%b A=%b Y=%b", E, A, Y_behav);
        end
    end
    endtask

 
 
 
endmodule
