`ifndef DIVISOR_8BITS
`define DIVISOR_8BITS

`include "subtrator_controlado.v"

module divisor_8bits(
    input [7:0] A,  // Dividendo
    input [7:0] B,  // Divisor
    output [7:0] Q, // Quociente
    output [7:0] R  // Resto
);

    // ========================================================================
    // LINHA 0 (Processa A[7])
    // Entrada X = {0,0,0,0,0,0,0, A[7]}
    // ========================================================================
    wire [7:0] rem0;   // Resto da linha 0
    wire [8:0] b0;     // Borrows da linha 0
    wire sel0;         // Controle da linha 0

    assign b0[0] = 1'b0; // Primeiro borrow é sempre 0

    // Instâncias manuais (bit a bit)
    celula_cs cs0_0 (.X(A[7]), .Y(B[0]), .B_in(b0[0]), .Sel(sel0), .R_out(rem0[0]), .B_out(b0[1]));
    celula_cs cs0_1 (.X(1'b0), .Y(B[1]), .B_in(b0[1]), .Sel(sel0), .R_out(rem0[1]), .B_out(b0[2]));
    celula_cs cs0_2 (.X(1'b0), .Y(B[2]), .B_in(b0[2]), .Sel(sel0), .R_out(rem0[2]), .B_out(b0[3]));
    celula_cs cs0_3 (.X(1'b0), .Y(B[3]), .B_in(b0[3]), .Sel(sel0), .R_out(rem0[3]), .B_out(b0[4]));
    celula_cs cs0_4 (.X(1'b0), .Y(B[4]), .B_in(b0[4]), .Sel(sel0), .R_out(rem0[4]), .B_out(b0[5]));
    celula_cs cs0_5 (.X(1'b0), .Y(B[5]), .B_in(b0[5]), .Sel(sel0), .R_out(rem0[5]), .B_out(b0[6]));
    celula_cs cs0_6 (.X(1'b0), .Y(B[6]), .B_in(b0[6]), .Sel(sel0), .R_out(rem0[6]), .B_out(b0[7]));
    celula_cs cs0_7 (.X(1'b0), .Y(B[7]), .B_in(b0[7]), .Sel(sel0), .R_out(rem0[7]), .B_out(b0[8]));

    // Lógica do Quociente: Se BorrowOut=1 (Negativo), Sel=0. Se BorrowOut=0, Sel=1.
    assign sel0 = ~b0[8];
    assign Q[7] = sel0;


    // ========================================================================
    // LINHA 1 (Processa A[6])
    // Entrada X deslocada: bit 0 recebe A[6], bit 1 recebe rem0[0], etc.
    // ========================================================================
    wire [7:0] rem1; wire [8:0] b1; wire sel1;
    assign b1[0] = 1'b0;

    celula_cs cs1_0 (.X(A[6]),    .Y(B[0]), .B_in(b1[0]), .Sel(sel1), .R_out(rem1[0]), .B_out(b1[1]));
    celula_cs cs1_1 (.X(rem0[0]), .Y(B[1]), .B_in(b1[1]), .Sel(sel1), .R_out(rem1[1]), .B_out(b1[2]));
    celula_cs cs1_2 (.X(rem0[1]), .Y(B[2]), .B_in(b1[2]), .Sel(sel1), .R_out(rem1[2]), .B_out(b1[3]));
    celula_cs cs1_3 (.X(rem0[2]), .Y(B[3]), .B_in(b1[3]), .Sel(sel1), .R_out(rem1[3]), .B_out(b1[4]));
    celula_cs cs1_4 (.X(rem0[3]), .Y(B[4]), .B_in(b1[4]), .Sel(sel1), .R_out(rem1[4]), .B_out(b1[5]));
    celula_cs cs1_5 (.X(rem0[4]), .Y(B[5]), .B_in(b1[5]), .Sel(sel1), .R_out(rem1[5]), .B_out(b1[6]));
    celula_cs cs1_6 (.X(rem0[5]), .Y(B[6]), .B_in(b1[6]), .Sel(sel1), .R_out(rem1[6]), .B_out(b1[7]));
    celula_cs cs1_7 (.X(rem0[6]), .Y(B[7]), .B_in(b1[7]), .Sel(sel1), .R_out(rem1[7]), .B_out(b1[8]));

    assign sel1 = ~b1[8];
    assign Q[6] = sel1;


    // ========================================================================
    // LINHA 2 (Processa A[5])
    // ========================================================================
    wire [7:0] rem2; wire [8:0] b2; wire sel2;
    assign b2[0] = 1'b0;

    celula_cs cs2_0 (.X(A[5]),    .Y(B[0]), .B_in(b2[0]), .Sel(sel2), .R_out(rem2[0]), .B_out(b2[1]));
    celula_cs cs2_1 (.X(rem1[0]), .Y(B[1]), .B_in(b2[1]), .Sel(sel2), .R_out(rem2[1]), .B_out(b2[2]));
    celula_cs cs2_2 (.X(rem1[1]), .Y(B[2]), .B_in(b2[2]), .Sel(sel2), .R_out(rem2[2]), .B_out(b2[3]));
    celula_cs cs2_3 (.X(rem1[2]), .Y(B[3]), .B_in(b2[3]), .Sel(sel2), .R_out(rem2[3]), .B_out(b2[4]));
    celula_cs cs2_4 (.X(rem1[3]), .Y(B[4]), .B_in(b2[4]), .Sel(sel2), .R_out(rem2[4]), .B_out(b2[5]));
    celula_cs cs2_5 (.X(rem1[4]), .Y(B[5]), .B_in(b2[5]), .Sel(sel2), .R_out(rem2[5]), .B_out(b2[6]));
    celula_cs cs2_6 (.X(rem1[5]), .Y(B[6]), .B_in(b2[6]), .Sel(sel2), .R_out(rem2[6]), .B_out(b2[7]));
    celula_cs cs2_7 (.X(rem1[6]), .Y(B[7]), .B_in(b2[7]), .Sel(sel2), .R_out(rem2[7]), .B_out(b2[8]));

    assign sel2 = ~b2[8];
    assign Q[5] = sel2;


    // ========================================================================
    // LINHA 3 (Processa A[4])
    // ========================================================================
    wire [7:0] rem3; wire [8:0] b3; wire sel3;
    assign b3[0] = 1'b0;

    celula_cs cs3_0 (.X(A[4]),    .Y(B[0]), .B_in(b3[0]), .Sel(sel3), .R_out(rem3[0]), .B_out(b3[1]));
    celula_cs cs3_1 (.X(rem2[0]), .Y(B[1]), .B_in(b3[1]), .Sel(sel3), .R_out(rem3[1]), .B_out(b3[2]));
    celula_cs cs3_2 (.X(rem2[1]), .Y(B[2]), .B_in(b3[2]), .Sel(sel3), .R_out(rem3[2]), .B_out(b3[3]));
    celula_cs cs3_3 (.X(rem2[2]), .Y(B[3]), .B_in(b3[3]), .Sel(sel3), .R_out(rem3[3]), .B_out(b3[4]));
    celula_cs cs3_4 (.X(rem2[3]), .Y(B[4]), .B_in(b3[4]), .Sel(sel3), .R_out(rem3[4]), .B_out(b3[5]));
    celula_cs cs3_5 (.X(rem2[4]), .Y(B[5]), .B_in(b3[5]), .Sel(sel3), .R_out(rem3[5]), .B_out(b3[6]));
    celula_cs cs3_6 (.X(rem2[5]), .Y(B[6]), .B_in(b3[6]), .Sel(sel3), .R_out(rem3[6]), .B_out(b3[7]));
    celula_cs cs3_7 (.X(rem2[6]), .Y(B[7]), .B_in(b3[7]), .Sel(sel3), .R_out(rem3[7]), .B_out(b3[8]));

    assign sel3 = ~b3[8];
    assign Q[4] = sel3;


    // ========================================================================
    // LINHA 4 (Processa A[3])
    // ========================================================================
    wire [7:0] rem4; wire [8:0] b4; wire sel4;
    assign b4[0] = 1'b0;

    celula_cs cs4_0 (.X(A[3]),    .Y(B[0]), .B_in(b4[0]), .Sel(sel4), .R_out(rem4[0]), .B_out(b4[1]));
    celula_cs cs4_1 (.X(rem3[0]), .Y(B[1]), .B_in(b4[1]), .Sel(sel4), .R_out(rem4[1]), .B_out(b4[2]));
    celula_cs cs4_2 (.X(rem3[1]), .Y(B[2]), .B_in(b4[2]), .Sel(sel4), .R_out(rem4[2]), .B_out(b4[3]));
    celula_cs cs4_3 (.X(rem3[2]), .Y(B[3]), .B_in(b4[3]), .Sel(sel4), .R_out(rem4[3]), .B_out(b4[4]));
    celula_cs cs4_4 (.X(rem3[3]), .Y(B[4]), .B_in(b4[4]), .Sel(sel4), .R_out(rem4[4]), .B_out(b4[5]));
    celula_cs cs4_5 (.X(rem3[4]), .Y(B[5]), .B_in(b4[5]), .Sel(sel4), .R_out(rem4[5]), .B_out(b4[6]));
    celula_cs cs4_6 (.X(rem3[5]), .Y(B[6]), .B_in(b4[6]), .Sel(sel4), .R_out(rem4[6]), .B_out(b4[7]));
    celula_cs cs4_7 (.X(rem3[6]), .Y(B[7]), .B_in(b4[7]), .Sel(sel4), .R_out(rem4[7]), .B_out(b4[8]));

    assign sel4 = ~b4[8];
    assign Q[3] = sel4;


    // ========================================================================
    // LINHA 5 (Processa A[2])
    // ========================================================================
    wire [7:0] rem5; wire [8:0] b5; wire sel5;
    assign b5[0] = 1'b0;

    celula_cs cs5_0 (.X(A[2]),    .Y(B[0]), .B_in(b5[0]), .Sel(sel5), .R_out(rem5[0]), .B_out(b5[1]));
    celula_cs cs5_1 (.X(rem4[0]), .Y(B[1]), .B_in(b5[1]), .Sel(sel5), .R_out(rem5[1]), .B_out(b5[2]));
    celula_cs cs5_2 (.X(rem4[1]), .Y(B[2]), .B_in(b5[2]), .Sel(sel5), .R_out(rem5[2]), .B_out(b5[3]));
    celula_cs cs5_3 (.X(rem4[2]), .Y(B[3]), .B_in(b5[3]), .Sel(sel5), .R_out(rem5[3]), .B_out(b5[4]));
    celula_cs cs5_4 (.X(rem4[3]), .Y(B[4]), .B_in(b5[4]), .Sel(sel5), .R_out(rem5[4]), .B_out(b5[5]));
    celula_cs cs5_5 (.X(rem4[4]), .Y(B[5]), .B_in(b5[5]), .Sel(sel5), .R_out(rem5[5]), .B_out(b5[6]));
    celula_cs cs5_6 (.X(rem4[5]), .Y(B[6]), .B_in(b5[6]), .Sel(sel5), .R_out(rem5[6]), .B_out(b5[7]));
    celula_cs cs5_7 (.X(rem4[6]), .Y(B[7]), .B_in(b5[7]), .Sel(sel5), .R_out(rem5[7]), .B_out(b5[8]));

    assign sel5 = ~b5[8];
    assign Q[2] = sel5;


    // ========================================================================
    // LINHA 6 (Processa A[1])
    // ========================================================================
    wire [7:0] rem6; wire [8:0] b6; wire sel6;
    assign b6[0] = 1'b0;

    celula_cs cs6_0 (.X(A[1]),    .Y(B[0]), .B_in(b6[0]), .Sel(sel6), .R_out(rem6[0]), .B_out(b6[1]));
    celula_cs cs6_1 (.X(rem5[0]), .Y(B[1]), .B_in(b6[1]), .Sel(sel6), .R_out(rem6[1]), .B_out(b6[2]));
    celula_cs cs6_2 (.X(rem5[1]), .Y(B[2]), .B_in(b6[2]), .Sel(sel6), .R_out(rem6[2]), .B_out(b6[3]));
    celula_cs cs6_3 (.X(rem5[2]), .Y(B[3]), .B_in(b6[3]), .Sel(sel6), .R_out(rem6[3]), .B_out(b6[4]));
    celula_cs cs6_4 (.X(rem5[3]), .Y(B[4]), .B_in(b6[4]), .Sel(sel6), .R_out(rem6[4]), .B_out(b6[5]));
    celula_cs cs6_5 (.X(rem5[4]), .Y(B[5]), .B_in(b6[5]), .Sel(sel6), .R_out(rem6[5]), .B_out(b6[6]));
    celula_cs cs6_6 (.X(rem5[5]), .Y(B[6]), .B_in(b6[6]), .Sel(sel6), .R_out(rem6[6]), .B_out(b6[7]));
    celula_cs cs6_7 (.X(rem5[6]), .Y(B[7]), .B_in(b6[7]), .Sel(sel6), .R_out(rem6[7]), .B_out(b6[8]));

    assign sel6 = ~b6[8];
    assign Q[1] = sel6;


    // ========================================================================
    // LINHA 7 (Processa A[0]) - FIM
    // ========================================================================
    wire [7:0] rem7; wire [8:0] b7; wire sel7;
    assign b7[0] = 1'b0;

    celula_cs cs7_0 (.X(A[0]),    .Y(B[0]), .B_in(b7[0]), .Sel(sel7), .R_out(rem7[0]), .B_out(b7[1]));
    celula_cs cs7_1 (.X(rem6[0]), .Y(B[1]), .B_in(b7[1]), .Sel(sel7), .R_out(rem7[1]), .B_out(b7[2]));
    celula_cs cs7_2 (.X(rem6[1]), .Y(B[2]), .B_in(b7[2]), .Sel(sel7), .R_out(rem7[2]), .B_out(b7[3]));
    celula_cs cs7_3 (.X(rem6[2]), .Y(B[3]), .B_in(b7[3]), .Sel(sel7), .R_out(rem7[3]), .B_out(b7[4]));
    celula_cs cs7_4 (.X(rem6[3]), .Y(B[4]), .B_in(b7[4]), .Sel(sel7), .R_out(rem7[4]), .B_out(b7[5]));
    celula_cs cs7_5 (.X(rem6[4]), .Y(B[5]), .B_in(b7[5]), .Sel(sel7), .R_out(rem7[5]), .B_out(b7[6]));
    celula_cs cs7_6 (.X(rem6[5]), .Y(B[6]), .B_in(b7[6]), .Sel(sel7), .R_out(rem7[6]), .B_out(b7[7]));
    celula_cs cs7_7 (.X(rem6[6]), .Y(B[7]), .B_in(b7[7]), .Sel(sel7), .R_out(rem7[7]), .B_out(b7[8]));

    assign sel7 = ~b7[8];
    assign Q[0] = sel7;

    // SAÍDA FINAL: RESTO
    assign R = rem7;

endmodule

`endif