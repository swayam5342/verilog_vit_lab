module tb_MUX_4to1;
    reg I0, I1, I2, I3;
    reg [1:0] sel;
    wire Y;

    MUX_4to1 uut (
        .I0(I0), .I1(I1), .I2(I2), .I3(I3),
        .sel(sel),
        .Y(Y)
    );

    initial begin
        I0 = 1'b0;  I1 = 1'b1;
        I2 = 1'b0;  I3 = 1'b1;

        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        $stop;
    end
endmodule
