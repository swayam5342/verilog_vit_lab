// Verilog module for Modulo-10 Counter (BCD Counter) using T Flip-Flops
module Modulo10Counter(
    input clk,
    input rst,
    output reg [3:0] count
);

    wire t0, t1, t2, t3;

    // T flip-flop input logic
    assign t0 = 1;
    assign t1 = count[0] & ~count[3];
    assign t2 = count[1] & count[0] & ~count[3];
    assign t3 = count[2] & count[1] & count[0] | count[3] & count[0];

    // T Flip-Flops implementation
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 4'b0000;
        end else begin
            count[0] <= count[0] ^ t0;
            count[1] <= count[1] ^ t1;
            count[2] <= count[2] ^ t2;
            count[3] <= count[3] ^ t3;
        end
    end

endmodule

// Verilog Testbench module for Modulo-10 Counter
module Modulo10Counter_tb;

    reg clk;
    reg rst;
    wire [3:0] count;

    // Instantiate the Modulo-10 counter module
    Modulo10Counter dut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock period of 10 time units
    end

    // Test sequence
    initial begin
        // Apply reset
        rst = 1;
        #10;
        rst = 0;
        #10;

        // Simulate for multiple clock cycles
        for (int i = 0; i < 15; i = i + 1) begin
            #10;
            $display("Time = %t, Count = %b", $time, count);
        end

        // End simulation
        $finish;
    end

endmodule