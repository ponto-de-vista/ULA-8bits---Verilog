module porta_nor(A, B, S);
    input A, B;
    output S;

    assign S = ~(A | B);
endmodule
