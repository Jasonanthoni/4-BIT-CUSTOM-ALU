module div (
    input  [3:0] A, B,      
    output reg [7:0] QUO 
);
    reg [3:0] quotient;
    reg [3:0] remainder;

    always @(*) begin
        if (B != 4'b0000) begin
            quotient  = A / B; 
            remainder = A % B;
        end else begin
            quotient  = 4'b0000;
            remainder = 4'b0000; 
        end
        QUO = {remainder, quotient}; 
    end

endmodule
