module alu_top (
    input  [3:0] A,        // input A
    input  [3:0] B,        // input B
    input  [2:0] opcode,   // control signal to select operation
    output reg [7:0] result, // output result
    output reg carry_out     // output carry flag
);

     // internal wires for each operation
    wire [4:0] add_out;  
    wire [4:0] sub_out;
    wire [7:0] mul_out;
    wire [7:0] div_out;
    wire [7:0] nand_out;
    wire [7:0] not_out;
    wire [7:0] cmp_out;
    wire [7:0] avg_out;

    // connect submodules
    add   U1 (.A(A), .B(B), .SUM(add_out[3:0]), .COUT(add_out[4]));    // adder
    sub   U2 (.A(A), .B(B), .DIFF(sub_out[3:0]), .COUT(sub_out[4]));   // subtractor
    mul   U3 (.A(A), .B(B), .product(mul_out));                        // multiplier
    div   U4 (.A(A), .B(B), .QUO(div_out));                            // divider
    nand_g U5 (.A(A), .B(B), .Y(nand_out));                            // NAND gate
    not_g  U6 (.A(A), .Y(not_out));                                    // NOT gate
    cmp    U7 (.A(A), .B(B), .Y(cmp_out));                             // comparator
    avg    U8 (.A(A), .B(B), .Y(avg_out));                              // average calculator

    // select operation based on opcode
    always @(*) begin
        case (opcode)
            3'b000: begin // ADD
                result    = {4'b0000, add_out[3:0]};
                carry_out = add_out[4];
            end
            3'b001: begin // SUB
                result    = {4'b0000, sub_out[3:0]};
                carry_out = sub_out[4];
            end
            3'b010: begin // MUL
                result    = mul_out;
                carry_out = 1'b0;
            end
            3'b011: begin // DIV
                result    = div_out;
                carry_out = 1'b0;
            end
            3'b100: begin // NAND
                result    = {nand_out};
                carry_out = 1'b0;
            end
            3'b101: begin // NOT
                result    = {not_out};
                carry_out = 1'b0;
            end
            3'b110: begin // CMP
                result    = cmp_out;
                carry_out = 1'b0;
            end
            3'b111: begin // AVG
                result    = avg_out;
                carry_out = 1'b0;
            end
            default: begin // default case
                result    = 8'b00000000;
                carry_out = 1'b0;
            end
        endcase
    end

endmodule
