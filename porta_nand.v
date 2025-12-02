`ifndef PORTA_NAND
`define PORTA_NAND

module porta_nand(A, B, S);
    input A, B;
    output S;

    assign S = ~(A & B);
endmodule

`endif
