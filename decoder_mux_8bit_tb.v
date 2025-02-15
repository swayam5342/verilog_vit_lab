module tb_MUX_4to1;
    reg [7:0] I0, I1, I2, I3;
    reg [1:0] sel;
    wire [7:0] Y;

    MUX_4to1 uut (
        .I0(I0), .I1(I1), .I2(I2), .I3(I3),
        .sel(sel),
        .Y(Y)
    );

    initial begin
        I0 = 8'hA1;  // Input 0
        I1 = 8'hB2;  // Input 1
        I2 = 8'hC3;  // Input 2
        I3 = 8'hD4;  // Input 3

        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        $stop;
    end
endmodule
