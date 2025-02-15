module Decoder_2to4 (
    input [1:0] sel,    // 2-bit select input
    output reg [3:0] D  // 4-bit output
);
    always @(*) begin
        case (sel)
            2'b00: D = 4'b0001;
            2'b01: D = 4'b0010;
            2'b10: D = 4'b0100;
            2'b11: D = 4'b1000;
            default: D = 4'b0000;
        endcase
    end
endmodule

module MUX_4to1 (
    input [7:0] I0, I1, I2, I3, // 8-bit inputs
    input [1:0] sel,            // 2-bit select input
    output reg [7:0] Y          // 8-bit output
);
    wire [3:0] D;  // Decoder output

    // Instantiate the 2-to-4 decoder
    Decoder_2to4 decoder_inst (
        .sel(sel),
        .D(D)
    );

    always @(*) begin
        case (D)
            4'b0001: Y = I0;
            4'b0010: Y = I1;
            4'b0100: Y = I2;
            4'b1000: Y = I3;
            default: Y = 8'b00000000;
        endcase
    end
endmodule
