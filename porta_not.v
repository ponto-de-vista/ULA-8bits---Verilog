`ifndef PORTA_NOT
`define PORTA_NOT

module porta_not(A, S);
    input A;
    output S;

    assign S = ~A;
endmodule
`endif
