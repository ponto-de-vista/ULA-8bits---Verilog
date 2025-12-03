`ifndef SUBTRATOR_CONTROLADO
`define SUBTRATOR_CONTROLADO

`include "subtrator_completo.v"

module celula_cs(
    input X,        // Bit do Resto Parcial (vem de cima/diagonal)
    input Y,        // Bit do Divisor (B)
    input B_in,     // Borrow de entrada (vem da direita)
    input Sel,      // Sinal de Seleção da Linha (1=Mantém, 0=Restaura)
    output R_out,   // Bit de Resto de saída (vai para baixo/diagonal)
    output B_out    // Borrow de saída (vai para esquerda)
);

    wire Diff; // Diferença calculada

    // Instância do seu subtrator completo
    subtrator_completo sub (
        .A(X), 
        .B(Y), 
        .C_in(B_in), 
        .S(Diff), 
        .C_out(B_out)
    );

    // Mux de Restauração (Figura 19 inset)
    // Se Sel=1 (Sucesso): Passa a diferença.
    // Se Sel=0 (Falha/Negativo): Restaura o valor original X.
    assign R_out = (Sel) ? Diff : X;

endmodule
`endif