module booth_multiplier_4bit(
    input signed [3:0] A, B,
    output reg signed [7:0] P
);
    integer i;
    reg [7:0] M, Q, Q_1;
    reg [3:0] count;
    reg C;

    always @(A, B) begin
        M = {A[3], A[3], A[3], A[3], A}; // Extend sign bit
        Q = {B, 4'b0000}; 
        Q_1 = 0;
        C = 0;
        count = 4;

        for (i = 0; i < 4; i = i + 1) begin
            case ({Q[0], Q_1})
                2'b01: {C, Q} = {C, Q} + {M, 4'b0000}; 
                2'b10: {C, Q} = {C, Q} - {M, 4'b0000};
            endcase
            {C, Q, Q_1} = {C, Q} >> 1;
        end
        P = Q;
    end
endmodule


module tb_booth_multiplier;
    reg signed [3:0] A, B;
    wire signed [7:0] P;

    booth_multiplier_4bit uut (
        .A(A),
        .B(B),
        .P(P)
    );

    initial begin
        $monitor("A = %d, B = %d, P = %d", A, B, P);

        A = 4'b0011; B = 4'b0010; #10; // 3 * 2 = 6
        A = 4'b1101; B = 4'b0011; #10; // -3 * 3 = -9
        A = 4'b0100; B = 4'b1100; #10; // 4 * -4 = -16
        A = 4'b1111; B = 4'b1111; #10; // -1 * -1 = 1

        $finish;
    end
endmodule
