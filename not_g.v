module not_g(
    input [3:0] A,       // input A
    output [7:0] Y       // output Y
);
    assign Y = {4'b0000, ~A};   // perform bitwise NOT and extend to 8 bits
endmodule
