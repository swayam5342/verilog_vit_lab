module t_ff (
    input wire clk,
    input wire reset,
    input wire t,
    output reg q
);
    always @(posedge clk) begin
        if (reset)
            q <= 0;
        else if (t)
            q <= ~q;
    end
endmodule



`timescale 1ns/1ps

module tb_t_ff;
    reg clk, reset, t;
    wire q;

    t_ff dut (.clk(clk), .reset(reset), .t(t), .q(q));

    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 1; t = 0;
        #10 reset = 0; t = 1;
        #10 t = 0;
        #10 t = 1;
        #10 reset = 1;
        #10 reset = 0; t = 1;
        #20 $stop;
    end
endmodule

