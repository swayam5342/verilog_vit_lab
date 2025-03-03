module array_multiplier_4bit(
    input [3:0] A, B,
    output [7:0] P
);
    wire [3:0] p0, p1, p2, p3;
    wire [7:0] sum1, sum2, sum3, carry1, carry2, carry3;

    assign p0 = A & {4{B[0]}};
    assign p1 = A & {4{B[1]}};
    assign p2 = A & {4{B[2]}};
    assign p3 = A & {4{B[3]}};

    assign sum1 = {p1, 1'b0} + {1'b0, p0};
    assign sum2 = {p2, 2'b00} + {2'b00, sum1};
    assign sum3 = {p3, 3'b000} + {3'b000, sum2};

    assign P = sum3;
endmodule

module tb_array_multiplier;
    reg [3:0] A, B;
    wire [7:0] P;

    array_multiplier_4bit uut (
        .A(A),
        .B(B),
        .P(P)
    );

    initial begin
        $monitor("A = %b, B = %b, P = %b", A, B, P);

        A = 4'b0011; B = 4'b0010; #10; // 3 * 2 = 6
        A = 4'b0101; B = 4'b0011; #10; // 5 * 3 = 15
        A = 4'b1111; B = 4'b0001; #10; // 15 * 1 = 15
        A = 4'b1010; B = 4'b1010; #10; // 10 * 10 = 100

        $finish;
    end
endmodule
