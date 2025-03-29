module bcd_counter (
    input wire clk,
    input wire reset,
    output reg [3:0] count
);

    // T flip-flop inputs
    wire [3:0] t;
    
    // T input logic for synchronous counter
    // T[0]: Toggle every clock cycle
    assign t[0] = 1'b1;
    
    // T[1]: Toggle when count[0] is 1
    assign t[1] = count[0];
    
    // T[2]: Toggle when count[1] and count[0] are both 1
    assign t[2] = count[1] & count[0];
    
    // T[3]: Toggle when count[2], count[1], and count[0] are all 1
    assign t[3] = count[2] & count[1] & count[0];
    
    // Synchronous counter implementation
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 4'b0000;
        end
        else begin
            // BCD counter: reset to 0 when count reaches 10 (1010)
            if (count == 4'b1001) begin
                count <= 4'b0000;
            end
            else begin
                // T flip-flop behavior: toggle when T=1
                count[0] <= count[0] ^ t[0];
                count[1] <= count[1] ^ t[1];
                count[2] <= count[2] ^ t[2];
                count[3] <= count[3] ^ t[3];
            end
        end
    end
    
endmodule