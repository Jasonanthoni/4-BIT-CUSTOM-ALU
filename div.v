module div (
    input  [3:0] A, B,       // inputs A and B
    output reg [7:0] QUO     // output (remainder + quotient)
);

    reg [3:0] quotient;      // to store quotient
    reg [3:0] remainder;     // to store remainder

    always @(*) begin
        if (B != 4'b0000) begin          // check for divide-by-zero
            quotient  = A / B;           // perform division
            remainder = A % B;           // find remainder
        end else begin
            quotient  = 4'b0000;         // if B is zero, set quotient to 0
            remainder = 4'b0000;         // set remainder to 0
        end
        QUO = {remainder, quotient};     // combine remainder and quotient
    end

endmodule
