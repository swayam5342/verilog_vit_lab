module jk_ff (
    input wire clk,
    input wire reset,
    input wire j,
    input wire k,
    output reg q
);
    always @(posedge clk) begin
        if (reset)
            q <= 0;
        else if (j & ~k)
            q <= 1;
        else if (~j & k)
            q <= 0;
        else if (j & k)
            q <= ~q;
    end
endmodule


`timescale 1ns/1ps

module tb_jk_ff;
    reg clk, reset, j, k;
    wire q;

    jk_ff dut (.clk(clk), .reset(reset), .j(j), .k(k), .q(q));

    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 1; j = 0; k = 0;
        #10 reset = 0; j = 1; k = 0;
        #10 j = 0; k = 1;
        #10 j = 1; k = 1;
        #10 reset = 1;
        #10 reset = 0; j = 1; k = 1;
        #20 $stop;
    end
endmodule
