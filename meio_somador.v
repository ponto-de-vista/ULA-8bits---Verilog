`ifndef MEIO_SOMADOR
`define MEIO_SOMADOR

module meio_somador(A, B, S, C_out);
    input A, B;
    output S, C_out;

    assign S = A ^ B;
    assign C_out = A & B;
endmodule
`endif
