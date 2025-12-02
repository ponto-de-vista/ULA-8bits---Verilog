`ifndef MULTIPLICADOR_8BITS
`define MULTIPLICADOR_8BITS

`include "meio_somador.v"
`include "somador_completo.v"

module multiplicador_8bits(
    input [7:0] A, 
    input [7:0] B, 
    output [15:0] P
);
    wire [7:0] pp0, pp1, pp2, pp3, pp4, pp5, pp6, pp7;

    assign pp0 = A & {8{B[0]}}; 
    assign pp1 = A & {8{B[1]}}; 
    assign pp2 = A & {8{B[2]}}; 
    assign pp3 = A & {8{B[3]}}; 
    assign pp4 = A & {8{B[4]}}; 
    assign pp5 = A & {8{B[5]}}; 
    assign pp6 = A & {8{B[6]}}; 
    assign pp7 = A & {8{B[7]}}; 

    assign P[0] = pp0[0];

    wire [7:0] s_st1; 
    wire [7:0] c_st1;

    meio_somador HA_st1_0 (.A(pp1[0]), .B(pp0[1]), .S(P[1]), .C_out(c_st1[0]));

    somador_completo FA_st1_1 (.A(pp1[1]), .B(pp0[2]), .C_in(c_st1[0]), .S(s_st1[1]), .C_out(c_st1[1]));
    somador_completo FA_st1_2 (.A(pp1[2]), .B(pp0[3]), .C_in(c_st1[1]), .S(s_st1[2]), .C_out(c_st1[2]));
    somador_completo FA_st1_3 (.A(pp1[3]), .B(pp0[4]), .C_in(c_st1[2]), .S(s_st1[3]), .C_out(c_st1[3]));
    somador_completo FA_st1_4 (.A(pp1[4]), .B(pp0[5]), .C_in(c_st1[3]), .S(s_st1[4]), .C_out(c_st1[4]));
    somador_completo FA_st1_5 (.A(pp1[5]), .B(pp0[6]), .C_in(c_st1[4]), .S(s_st1[5]), .C_out(c_st1[5]));
    somador_completo FA_st1_6 (.A(pp1[6]), .B(pp0[7]), .C_in(c_st1[5]), .S(s_st1[6]), .C_out(c_st1[6]));

    meio_somador HA_st1_7 (.A(pp1[7]), .B(c_st1[6]), .S(s_st1[7]), .C_out(c_st1[7]));

    wire [7:0] s_st2; 
    wire [7:0] c_st2;

    meio_somador HA_st2_0 (.A(pp2[0]), .B(s_st1[1]), .S(P[2]), .C_out(c_st2[0]));

    somador_completo FA_st2_1 (.A(pp2[1]), .B(s_st1[2]), .C_in(c_st2[0]), .S(s_st2[1]), .C_out(c_st2[1]));
    somador_completo FA_st2_2 (.A(pp2[2]), .B(s_st1[3]), .C_in(c_st2[1]), .S(s_st2[2]), .C_out(c_st2[2]));
    somador_completo FA_st2_3 (.A(pp2[3]), .B(s_st1[4]), .C_in(c_st2[2]), .S(s_st2[3]), .C_out(c_st2[3]));
    somador_completo FA_st2_4 (.A(pp2[4]), .B(s_st1[5]), .C_in(c_st2[3]), .S(s_st2[4]), .C_out(c_st2[4]));
    somador_completo FA_st2_5 (.A(pp2[5]), .B(s_st1[6]), .C_in(c_st2[4]), .S(s_st2[5]), .C_out(c_st2[5]));
    somador_completo FA_st2_6 (.A(pp2[6]), .B(s_st1[7]), .C_in(c_st2[5]), .S(s_st2[6]), .C_out(c_st2[6]));
    
    somador_completo FA_st2_7 (.A(pp2[7]), .B(c_st1[7]), .C_in(c_st2[6]), .S(s_st2[7]), .C_out(c_st2[7]));

    wire [7:0] s_st3; wire [7:0] c_st3;
    meio_somador HA_st3_0 (.A(pp3[0]), .B(s_st2[1]), .S(P[3]), .C_out(c_st3[0]));
    somador_completo FA_st3_1 (.A(pp3[1]), .B(s_st2[2]), .C_in(c_st3[0]), .S(s_st3[1]), .C_out(c_st3[1]));
    somador_completo FA_st3_2 (.A(pp3[2]), .B(s_st2[3]), .C_in(c_st3[1]), .S(s_st3[2]), .C_out(c_st3[2]));
    somador_completo FA_st3_3 (.A(pp3[3]), .B(s_st2[4]), .C_in(c_st3[2]), .S(s_st3[3]), .C_out(c_st3[3]));
    somador_completo FA_st3_4 (.A(pp3[4]), .B(s_st2[5]), .C_in(c_st3[3]), .S(s_st3[4]), .C_out(c_st3[4]));
    somador_completo FA_st3_5 (.A(pp3[5]), .B(s_st2[6]), .C_in(c_st3[4]), .S(s_st3[5]), .C_out(c_st3[5]));
    somador_completo FA_st3_6 (.A(pp3[6]), .B(s_st2[7]), .C_in(c_st3[5]), .S(s_st3[6]), .C_out(c_st3[6]));
    somador_completo FA_st3_7 (.A(pp3[7]), .B(c_st2[7]), .C_in(c_st3[6]), .S(s_st3[7]), .C_out(c_st3[7]));

    wire [7:0] s_st4; wire [7:0] c_st4;
    meio_somador HA_st4_0 (.A(pp4[0]), .B(s_st3[1]), .S(P[4]), .C_out(c_st4[0]));
    somador_completo FA_st4_1 (.A(pp4[1]), .B(s_st3[2]), .C_in(c_st4[0]), .S(s_st4[1]), .C_out(c_st4[1]));
    somador_completo FA_st4_2 (.A(pp4[2]), .B(s_st3[3]), .C_in(c_st4[1]), .S(s_st4[2]), .C_out(c_st4[2]));
    somador_completo FA_st4_3 (.A(pp4[3]), .B(s_st3[4]), .C_in(c_st4[2]), .S(s_st4[3]), .C_out(c_st4[3]));
    somador_completo FA_st4_4 (.A(pp4[4]), .B(s_st3[5]), .C_in(c_st4[3]), .S(s_st4[4]), .C_out(c_st4[4]));
    somador_completo FA_st4_5 (.A(pp4[5]), .B(s_st3[6]), .C_in(c_st4[4]), .S(s_st4[5]), .C_out(c_st4[5]));
    somador_completo FA_st4_6 (.A(pp4[6]), .B(s_st3[7]), .C_in(c_st4[5]), .S(s_st4[6]), .C_out(c_st4[6]));
    somador_completo FA_st4_7 (.A(pp4[7]), .B(c_st3[7]), .C_in(c_st4[6]), .S(s_st4[7]), .C_out(c_st4[7]));

    wire [7:0] s_st5; wire [7:0] c_st5;
    meio_somador HA_st5_0 (.A(pp5[0]), .B(s_st4[1]), .S(P[5]), .C_out(c_st5[0]));
    somador_completo FA_st5_1 (.A(pp5[1]), .B(s_st4[2]), .C_in(c_st5[0]), .S(s_st5[1]), .C_out(c_st5[1]));
    somador_completo FA_st5_2 (.A(pp5[2]), .B(s_st4[3]), .C_in(c_st5[1]), .S(s_st5[2]), .C_out(c_st5[2]));
    somador_completo FA_st5_3 (.A(pp5[3]), .B(s_st4[4]), .C_in(c_st5[2]), .S(s_st5[3]), .C_out(c_st5[3]));
    somador_completo FA_st5_4 (.A(pp5[4]), .B(s_st4[5]), .C_in(c_st5[3]), .S(s_st5[4]), .C_out(c_st5[4]));
    somador_completo FA_st5_5 (.A(pp5[5]), .B(s_st4[6]), .C_in(c_st5[4]), .S(s_st5[5]), .C_out(c_st5[5]));
    somador_completo FA_st5_6 (.A(pp5[6]), .B(s_st4[7]), .C_in(c_st5[5]), .S(s_st5[6]), .C_out(c_st5[6]));
    somador_completo FA_st5_7 (.A(pp5[7]), .B(c_st4[7]), .C_in(c_st5[6]), .S(s_st5[7]), .C_out(c_st5[7]));

    wire [7:0] s_st6; wire [7:0] c_st6;
    meio_somador HA_st6_0 (.A(pp6[0]), .B(s_st5[1]), .S(P[6]), .C_out(c_st6[0]));
    somador_completo FA_st6_1 (.A(pp6[1]), .B(s_st5[2]), .C_in(c_st6[0]), .S(s_st6[1]), .C_out(c_st6[1]));
    somador_completo FA_st6_2 (.A(pp6[2]), .B(s_st5[3]), .C_in(c_st6[1]), .S(s_st6[2]), .C_out(c_st6[2]));
    somador_completo FA_st6_3 (.A(pp6[3]), .B(s_st5[4]), .C_in(c_st6[2]), .S(s_st6[3]), .C_out(c_st6[3]));
    somador_completo FA_st6_4 (.A(pp6[4]), .B(s_st5[5]), .C_in(c_st6[3]), .S(s_st6[4]), .C_out(c_st6[4]));
    somador_completo FA_st6_5 (.A(pp6[5]), .B(s_st5[6]), .C_in(c_st6[4]), .S(s_st6[5]), .C_out(c_st6[5]));
    somador_completo FA_st6_6 (.A(pp6[6]), .B(s_st5[7]), .C_in(c_st6[5]), .S(s_st6[6]), .C_out(c_st6[6]));
    somador_completo FA_st6_7 (.A(pp6[7]), .B(c_st5[7]), .C_in(c_st6[6]), .S(s_st6[7]), .C_out(c_st6[7]));

    wire [7:0] s_st7; wire [7:0] c_st7;

    meio_somador HA_st7_0 (.A(pp7[0]), .B(s_st6[1]), .S(P[7]), .C_out(c_st7[0]));

    somador_completo FA_st7_1 (.A(pp7[1]), .B(s_st6[2]), .C_in(c_st7[0]), .S(P[8]),  .C_out(c_st7[1]));
    somador_completo FA_st7_2 (.A(pp7[2]), .B(s_st6[3]), .C_in(c_st7[1]), .S(P[9]),  .C_out(c_st7[2]));
    somador_completo FA_st7_3 (.A(pp7[3]), .B(s_st6[4]), .C_in(c_st7[2]), .S(P[10]), .C_out(c_st7[3]));
    somador_completo FA_st7_4 (.A(pp7[4]), .B(s_st6[5]), .C_in(c_st7[3]), .S(P[11]), .C_out(c_st7[4]));
    somador_completo FA_st7_5 (.A(pp7[5]), .B(s_st6[6]), .C_in(c_st7[4]), .S(P[12]), .C_out(c_st7[5]));
    somador_completo FA_st7_6 (.A(pp7[6]), .B(s_st6[7]), .C_in(c_st7[5]), .S(P[13]), .C_out(c_st7[6]));

    somador_completo FA_st7_7 (.A(pp7[7]), .B(c_st6[7]), .C_in(c_st7[6]), .S(P[14]), .C_out(P[15]));
endmodule

`endif