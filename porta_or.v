`ifndef PORTA_OR
`define PORTA_OR

module porta_or(A, B, S);
    input A, B;
    output S;

    assign S = A | B;
endmodule
`endif
