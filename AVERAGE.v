module average(input [3:0] A, input [3:0] B, output [7:0] Y);
    wire [7:0] sum;
    wire [7:0] avg;
    ADD add1 (.A(A), .B(B), .Y(sum));  // instantiate the addition module
    assign avg = sum >> 1;  // right shift by 1 = divide by 2  
    assign Y = avg;
endmodule