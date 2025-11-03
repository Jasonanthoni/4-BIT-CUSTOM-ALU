module compare(input [3:0] A, B, output reg [7:0] Y);
    always @(*) begin
        if (A == B)
            Y = 8'b00000001;   // Equal
        else if (A > B)
            Y = 8'b00000010;   // Greater
        else
            Y = 8'b00000100;   // Less
    end
endmodule