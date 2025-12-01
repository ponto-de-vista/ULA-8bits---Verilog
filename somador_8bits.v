`include "meio_somador.v"
`include "somador_completo.v"

module somador_8bits(A, B, S, C_out);
    input [7:0] A, B;
    output [7:0] S;
    output C_out;
    wire [6:0] c;

    meio_somador ms_0(.A(A[0]), .B(B[0]), .S(S[0]), .C_out(c[0]));
    somador_completo sc_0(.A(A[1]), .B(B[1]), .C_in(c[0]), .S(S[1]), .C_out(c[1]));
    somador_completo sc_1(.A(A[2]), .B(B[2]), .C_in(c[1]), .S(S[2]), .C_out(c[2]));
    somador_completo sc_2(.A(A[3]), .B(B[3]), .C_in(c[2]), .S(S[3]), .C_out(c[3]));
    somador_completo sc_3(.A(A[4]), .B(B[4]), .C_in(c[3]), .S(S[4]), .C_out(c[4]));
    somador_completo sc_4(.A(A[5]), .B(B[5]), .C_in(c[4]), .S(S[5]), .C_out(c[5]));
    somador_completo sc_5(.A(A[6]), .B(B[6]), .C_in(c[5]), .S(S[6]), .C_out(c[6]));
    somador_completo sc_6(.A(A[7]), .B(B[7]), .C_in(c[6]), .S(S[7]), .C_out(C_out));
endmodule