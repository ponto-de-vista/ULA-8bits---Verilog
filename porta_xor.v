`ifndef PORTA_XOR
`define PORTA_XOR

module porta_xor(A, B, S);
    input A, B;
    output S;

    assign S = A ^ B;
endmodule

`endif
