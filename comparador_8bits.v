`ifndef COMPARADOR_8BITS
`define COMPARADOR_8BITS

module comparador_8bits(A, B, Maior, Menor, Igual);
    input [7:0] A, B;
    output Maior, Menor, Igual;

    assign Maior = (A > B) ? 1 : 0;
    assign Menor = (A < B) ? 1 : 0;
    assign Igual = (A == B) ? 1 : 0;
endmodule

`endif
