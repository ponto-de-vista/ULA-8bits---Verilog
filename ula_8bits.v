`include "subtrator_8bits.v"
`include "multiplicador_8bits.v"
`include "divisor_8bits.v"
`include "comparador_8bits.v"
`include "porta_and.v"
`include "porta_or.v"
`include "porta_not.v"
`include "porta_nand.v"
`include "porta_nor.v"
`include "porta_xor.v"

module ula_8bits(A, B, Sel_Op, Resultado, Maior, Menor, Igual);
    input [7:0] A, B;
    input [3:0] Sel_Op;
    output [15:0] Resultado;
    output Maior, Menor, Igual;

    wire [7:0] soma, subtracao;
    wire [15:0] multiplicacao;
    wire [7:0] quociente, resto;
    wire [7:0] resultado_logico;
    wire carry_soma, carry_subtracao;

    // Operações aritméticas
    somador_8bits somador(.A(A), .B(B), .S(soma), .C_out(carry_soma));
    subtrator_8bits subtrator(.A(A), .B(B), .S(subtracao), .C_out(carry_subtracao));
    multiplicador_8bits multiplicador(.A(A), .B(B), .P(multiplicacao));
    divisor_8bits divisor(.A(A), .B(B), .Q(quociente), .R(resto));

    // Operações lógicas (bit a bit)
    genvar i;
    generate
        for(i = 0; i < 8; i = i + 1) begin : logical_ops
            wire not_a, and_ab, or_ab, nand_ab, nor_ab, xor_ab;
            
            porta_not not_op(.A(A[i]), .S(not_a));
            porta_and and_op(.A(A[i]), .B(B[i]), .S(and_ab));
            porta_or or_op(.A(A[i]), .B(B[i]), .S(or_ab));
            porta_nand nand_op(.A(A[i]), .B(B[i]), .S(nand_ab));
            porta_nor nor_op(.A(A[i]), .B(B[i]), .S(nor_ab));
            porta_xor xor_op(.A(A[i]), .B(B[i]), .S(xor_ab));

            // Seletor para operações lógicas
            assign resultado_logico[i] = (Sel_Op == 4'b0110) ? and_ab :
                                         (Sel_Op == 4'b0111) ? or_ab :
                                         (Sel_Op == 4'b1000) ? nand_ab :
                                         (Sel_Op == 4'b1001) ? nor_ab :
                                         (Sel_Op == 4'b1010) ? xor_ab :
                                         (Sel_Op == 4'b1011) ? not_a : 1'bx;
        end
    endgenerate

    // Comparador
    comparador_8bits comparador(.A(A), .B(B), .Maior(Maior), .Menor(Menor), .Igual(Igual));

    // Seletor de operação
    assign Resultado = (Sel_Op == 4'b0000) ? {{8{soma[7]}}, soma} :           // Soma
                       (Sel_Op == 4'b0001) ? {{8{subtracao[7]}}, subtracao} : // Subtração
                       (Sel_Op == 4'b0010) ? multiplicacao :                   // Multiplicação
                       (Sel_Op == 4'b0011) ? {{8{quociente[7]}}, quociente} :  // Divisão (quociente)
                       (Sel_Op == 4'b0100) ? {{8{resto[7]}}, resto} :          // Divisão (resto)
                       (Sel_Op == 4'b0110 | Sel_Op == 4'b0111 | Sel_Op == 4'b1000 | Sel_Op == 4'b1001 | Sel_Op == 4'b1010 | Sel_Op == 4'b1011) ? {{8{1'b0}}, resultado_logico} : // Operações lógicas
                       16'bxxxxxxxxxxxxxxxx;

endmodule
