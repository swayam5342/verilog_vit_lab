// Verilog module for T Flip-Flop
module T_FF(
    input clk,
    input reset,
    input t,
    output reg q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 0;
        else if (t)
            q <= ~q;
    end
endmodule

// Mod-10 (BCD) Counter using T Flip-Flops
module mod10_counter(
    input clk,
    input reset,
    output wire [3:0] q
);
    wire t0, t1, t2, t3;
    wire q0, q1, q2, q3;
    
    assign t0 = 1; // Always toggles
    assign t1 = q0; //change these as they are worong
    assign t2 = q0 & q1;
    assign t3 = q0 & q1 & q2;
    
    T_FF ff0 (.clk(clk), .reset(reset), .t(t0), .q(q0));
    T_FF ff1 (.clk(clk), .reset(reset), .t(t1), .q(q1));
    T_FF ff2 (.clk(clk), .reset(reset), .t(t2), .q(q2));
    T_FF ff3 (.clk(clk), .reset(reset), .t(t3), .q(q3));
    
    assign q = {q3, q2, q1, q0};
    
    always @(posedge clk or posedge reset) begin
        if (reset || q == 4'b1001)
            {q3, q2, q1, q0} <= 4'b0000; // Reset to 0 after 9
    end
endmodule

// Testbench for Mod-10 Counter
module tb_mod10_counter;
    reg clk;
    reg reset;
    wire [3:0] q;
    
    // Instantiate the counter module
    mod10_counter uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );
    
    // Generate clock signal
    always #5 clk = ~clk;
    
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        #10;
        reset = 0;
        
        // Run simulation for 100 time units
        #100;
        
        // Apply reset
        reset = 1;
        #10;
        reset = 0;
        
        // Run simulation for more time
        #100;
        
        // End simulation
        $stop;
    end
    
    initial begin
        $monitor("Time=%0t | Reset=%b | Q=%b", $time, reset, q);
    end
    
endmodule
