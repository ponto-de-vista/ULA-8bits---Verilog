`ifndef PORTA_AND
`define PORTA_AND

module porta_and(A, B, S);
    input A, B;
    output S;

    assign S = A & B;
endmodule

`endif
