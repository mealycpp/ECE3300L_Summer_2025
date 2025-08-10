`timescale 1ns/1ps
module load_fsm(
    input  wire       clk,
    input  wire       rst, // Changed to active-high
    input  wire       load_pulse,
    output wire [3:0] slot_onehot,
    output reg        wr_res, 
    output reg        wr_r, 
    output reg        wr_g, 
    output reg        wr_b
);

    reg [1:0] slot;

    // FSM state transition logic
    always @(posedge clk or posedge rst) begin
        if (rst)
            slot <= 2'd0;
        else if (load_pulse)
            slot <= slot + 1;
    end
    
    // One-hot encoding of the current state for LED display
    assign slot_onehot = (1 << slot);

    // FSM output logic
    always @(*) begin
        // Default values
        wr_res = 1'b0;
        wr_r = 1'b0;
        wr_g = 1'b0;
        wr_b = 1'b0;
        
        // Assert the correct write enable based on the current slot
        // The write enable is high only for one cycle when load_pulse is high
        case (slot)
            2'd0: wr_res = load_pulse;
            2'd1: wr_r   = load_pulse;
            2'd2: wr_g   = load_pulse;
            2'd3: wr_b   = load_pulse;
        endcase
    end

endmodule