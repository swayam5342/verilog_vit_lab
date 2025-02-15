module Adder_Subtractor_4bit (
    input [3:0] A,      // 4-bit Input A
    input [3:0] B,      // 4-bit Input B
    input add_sub,      // Control Signal: 0 for Add, 1 for Subtract
    output [3:0] Sum,   // 4-bit Output Sum/Difference
    output Cout         // Carry/Borrow Output
);
    wire [3:0] B_xor;   // XOR-ed version of B
    wire C_in;          // Internal Carry/Borrow bit

    assign B_xor = B ^ {4{add_sub}};  // If add_sub=1, B becomes ~B (Two's Complement Step 1)
    assign C_in = add_sub;            // If add_sub=1, we add 1 (Two's Complement Step 2)

    // Perform 4-bit addition
    assign {Cout, Sum} = A + B_xor + C_in;

endmodule
