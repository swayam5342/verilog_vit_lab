module tb_Adder_Subtractor_4bit;
    reg [3:0] A, B;
    reg add_sub;
    wire [3:0] Sum;
    wire Cout;

    Adder_Subtractor_4bit uut (
        .A(A),
        .B(B),
        .add_sub(add_sub),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        $monitor("A=%b, B=%b, add_sub=%b, Sum=%b, Cout=%b", A, B, add_sub, Sum, Cout);
        
        A = 4'b0101; B = 4'b0011; add_sub = 0; #10;  // 5 + 3 = 8
        A = 4'b0101; B = 4'b0011; add_sub = 1; #10;  // 5 - 3 = 2
        A = 4'b1000; B = 4'b0001; add_sub = 0; #10;  // 8 + 1 = 9
        A = 4'b1000; B = 4'b0001; add_sub = 1; #10;  // 8 - 1 = 7
        A = 4'b0111; B = 4'b0111; add_sub = 0; #10;  // 7 + 7 = 14
        A = 4'b0111; B = 4'b0111; add_sub = 1; #10;  // 7 - 7 = 0
        A = 4'b0000; B = 4'b0001; add_sub = 1; #10;  // 0 - 1 = -1 (1111 in 4-bit)

        $stop;
    end
endmodule
