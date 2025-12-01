`include "somador_8bits.v"

module multiplicador_8bits(A, B, P);
    input [7:0] A, B;
    output [15:0] P;
    
    wire [15:0] produto_parcial_1, produto_parcial_2, produto_parcial_3, produto_parcial_4;
    wire [15:0] produto_parcial_5, produto_parcial_6, produto_parcial_7, produto_parcial_8;
    wire [15:0] soma_1_2, soma_3_4, soma_5_6, soma_1_2_3_4, soma_5_6_7, soma_7_8, soma_5_6_7_8;
    wire carry_out_1, carry_out_2, carry_out_3, carry_out_4, carry_out_5, carry_out_6, carry_out_7_1, carry_out_7_2;

    // Produtos parciais com AND bit a bit (portas AND implementadas com logic)
    // PP0: B[0] * A[7:0]
    assign produto_parcial_1[7:0] = {A[7] & B[0], A[6] & B[0], A[5] & B[0], A[4] & B[0], 
                                      A[3] & B[0], A[2] & B[0], A[1] & B[0], A[0] & B[0]};
    assign produto_parcial_1[15:8] = 8'b0;

    // PP1: B[1] * A[7:0] (deslocado 1 posição para esquerda)
    assign produto_parcial_2[8:1] = {A[7] & B[1], A[6] & B[1], A[5] & B[1], A[4] & B[1], 
                                      A[3] & B[1], A[2] & B[1], A[1] & B[1], A[0] & B[1]};
    assign produto_parcial_2[0] = 1'b0;
    assign produto_parcial_2[15:9] = 7'b0;

    // PP2: B[2] * A[7:0] (deslocado 2 posições para esquerda)
    assign produto_parcial_3[9:2] = {A[7] & B[2], A[6] & B[2], A[5] & B[2], A[4] & B[2], 
                                      A[3] & B[2], A[2] & B[2], A[1] & B[2], A[0] & B[2]};
    assign produto_parcial_3[1:0] = 2'b0;
    assign produto_parcial_3[15:10] = 6'b0;

    // PP3: B[3] * A[7:0] (deslocado 3 posições para esquerda)
    assign produto_parcial_4[10:3] = {A[7] & B[3], A[6] & B[3], A[5] & B[3], A[4] & B[3], 
                                       A[3] & B[3], A[2] & B[3], A[1] & B[3], A[0] & B[3]};
    assign produto_parcial_4[2:0] = 3'b0;
    assign produto_parcial_4[15:11] = 5'b0;

    // PP4: B[4] * A[7:0] (deslocado 4 posições para esquerda)
    assign produto_parcial_5[11:4] = {A[7] & B[4], A[6] & B[4], A[5] & B[4], A[4] & B[4], 
                                       A[3] & B[4], A[2] & B[4], A[1] & B[4], A[0] & B[4]};
    assign produto_parcial_5[3:0] = 4'b0;
    assign produto_parcial_5[15:12] = 4'b0;

    // PP5: B[5] * A[7:0] (deslocado 5 posições para esquerda)
    assign produto_parcial_6[12:5] = {A[7] & B[5], A[6] & B[5], A[5] & B[5], A[4] & B[5], 
                                       A[3] & B[5], A[2] & B[5], A[1] & B[5], A[0] & B[5]};
    assign produto_parcial_6[4:0] = 5'b0;
    assign produto_parcial_6[15:13] = 3'b0;

    // PP6: B[6] * A[7:0] (deslocado 6 posições para esquerda)
    assign produto_parcial_7[13:6] = {A[7] & B[6], A[6] & B[6], A[5] & B[6], A[4] & B[6], 
                                       A[3] & B[6], A[2] & B[6], A[1] & B[6], A[0] & B[6]};
    assign produto_parcial_7[5:0] = 6'b0;
    assign produto_parcial_7[15:14] = 2'b0;

    assign produto_parcial_8[14:7] = {A[7] & B[7], A[6] & B[7], A[5] & B[7], A[4] & B[7], 
                                      A[3] & B[7], A[2] & B[7], A[1] & B[7], A[0] & B[7]};
    assign produto_parcial_8[6:0] = 7'b0;
    assign produto_parcial_8[15] = 1'b0;


// Soma 1+2
    somador_8bits somador_1_L(.A(produto_parcial_1[7:0]), .B(produto_parcial_2[7:0]), .S(soma_1_2[7:0]), .C_out(carry_out_1));
    somador_8bits somador_1_H(.A(produto_parcial_1[15:8]), .B(produto_parcial_2[15:8]), .S(soma_1_2[15:8]), .C_out()); // Nota: O carry do Low deveria entrar aqui se seu módulo suportar
    
    // Soma 3+4
    somador_8bits somador_2_L(.A(produto_parcial_3[7:0]), .B(produto_parcial_4[7:0]), .S(soma_3_4[7:0]), .C_out(carry_out_2));
    somador_8bits somador_2_H(.A(produto_parcial_3[15:8]), .B(produto_parcial_4[15:8]), .S(soma_3_4[15:8]), .C_out());
    
    // Soma 5+6
    somador_8bits somador_3_L(.A(produto_parcial_5[7:0]), .B(produto_parcial_6[7:0]), .S(soma_5_6[7:0]), .C_out(carry_out_3));
    somador_8bits somador_3_H(.A(produto_parcial_5[15:8]), .B(produto_parcial_6[15:8]), .S(soma_5_6[15:8]), .C_out());

    // Soma 7+8 (ESTA É A PARTE QUE VOCÊ PRECISAVA ADICIONAR)
    somador_8bits somador_4_L(.A(produto_parcial_7[7:0]), .B(produto_parcial_8[7:0]), .S(soma_7_8[7:0]), .C_out(carry_out_4));
    somador_8bits somador_4_H(.A(produto_parcial_7[15:8]), .B(produto_parcial_8[15:8]), .S(soma_7_8[15:8]), .C_out());

    // --- NÍVEL 2: Somar os resultados do nível 1 ---

    // Soma (1+2) + (3+4)
    somador_8bits somador_5_L(.A(soma_1_2[7:0]), .B(soma_3_4[7:0]), .S(soma_1_2_3_4[7:0]), .C_out(carry_out_5));
    somador_8bits somador_5_H(.A(soma_1_2[15:8]), .B(soma_3_4[15:8]), .S(soma_1_2_3_4[15:8]), .C_out());

    // Soma (5+6) + (7+8) (MODIFICADO PARA INCLUIR O NOVO PAR)
    somador_8bits somador_6_L(.A(soma_5_6[7:0]), .B(soma_7_8[7:0]), .S(soma_5_6_7_8[7:0]), .C_out(carry_out_6));
    somador_8bits somador_6_H(.A(soma_5_6[15:8]), .B(soma_7_8[15:8]), .S(soma_5_6_7_8[15:8]), .C_out());

    // --- NÍVEL 3: Soma Final ---
    somador_8bits somador_final_L(.A(soma_1_2_3_4[7:0]), .B(soma_5_6_7_8[7:0]), .S(P[7:0]), .C_out(carry_out_7_1));
    somador_8bits somador_final_H(.A(soma_1_2_3_4[15:8]), .B(soma_5_6_7_8[15:8]), .S(P[15:8]), .C_out());
endmodule
