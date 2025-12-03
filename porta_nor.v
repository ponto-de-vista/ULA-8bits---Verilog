`ifndef PORTA_NOR
`define PORTA_NOR

module porta_nor(A, B, S);
    input A, B;
    output S;

    assign S = ~(A | B);
endmodule
`endif
