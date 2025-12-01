`include "ula_8bits.v"

module ula_8bits_tb();
    reg [7:0] A, B;
    reg [3:0] Sel_Op;
    wire [15:0] Resultado;
    wire Maior, Menor, Igual;
    
    // Instancia a ULA
    ula_8bits ula(.A(A), .B(B), .Sel_Op(Sel_Op), .Resultado(Resultado), 
                   .Maior(Maior), .Menor(Menor), .Igual(Igual));
    
    initial begin
        $dumpfile("ula_8bits_tb.vcd");
        $dumpvars(0, ula_8bits_tb);

        $display("===== TESTE DA ULA 8 BITS =====");
        $display("Formato: Sel_Op | A | B | Resultado | Maior | Menor | Igual | Overflow");
        $display("================================");
        
        // Teste 1: Soma (Sel_Op = 0000)
        $display("\n--- OPERACAO DE SOMA (Sel_Op = 0000) ---");
        A = 8'd50;
        B = 8'd30;
        Sel_Op = 4'b0000;
        #10;
        $display("Soma: %d + %d = %d (esperado: 80)", A, B, Resultado[7:0]);
        
        // Teste 2: Soma simples
        A = 8'd20;
        B = 8'd15;
        Sel_Op = 4'b0000;
        #10;
        $display("Soma: %d + %d = %d (esperado: 35)", A, B, Resultado[7:0]);
        
        // Teste 3: Subtracao (Sel_Op = 0001)
        $display("\n--- OPERACAO DE SUBTRACAO (Sel_Op = 0001) ---");
        A = 8'd100;
        B = 8'd30;
        Sel_Op = 4'b0001;
        #10;
        $display("Subtracao: %d - %d = %d (esperado: 70)", A, B, Resultado[7:0]);
        
        // Teste 4: Multiplicacao (Sel_Op = 0010)
        $display("\n--- OPERACAO DE MULTIPLICACAO (Sel_Op = 0010) ---");
        A = 8'd3;
        B = 8'd90;
        Sel_Op = 4'b0010;
        #10;
        $display("Multiplicacao: %d * %d = %d (esperado: 128)", A, B, Resultado);
        
        // Teste 5: Multiplicacao maior
        A = 8'd20;
        B = 8'd20;
        Sel_Op = 4'b0010;
        #10;
        $display("Multiplicacao: %d * %d = %d (esperado: 400)", A, B, Resultado);
        
        // Teste 6: Divisao - Quociente (Sel_Op = 0011)
        $display("\n--- OPERACAO DE DIVISAO - QUOCIENTE (Sel_Op = 0011) ---");
        A = 8'd100;
        B = 8'd5;
        Sel_Op = 4'b0011;
        #10;
        $display("Divisao: %d / %d = %d (esperado quociente: 20)", A, B, Resultado[7:0]);
        
        // Teste 7: Divisao - Resto (Sel_Op = 0100)
        $display("\n--- OPERACAO DE DIVISAO - RESTO (Sel_Op = 0100) ---");
        A = 8'd23;
        B = 8'd5;
        Sel_Op = 4'b0100;
        #10;
        $display("Divisao: %d mod %d = %d (esperado resto: 3)", A, B, Resultado[7:0]);
        
        // Teste 8: AND logico (Sel_Op = 0110)
        $display("\n--- OPERACAO AND LOGICO (Sel_Op = 0110) ---");
        A = 8'b11110000;
        B = 8'b10101010;
        Sel_Op = 4'b0110;
        #10;
        $display("AND: %b AND %b = %b (esperado: 10100000)", A, B, Resultado[7:0]);
        
        // Teste 9: OR logico (Sel_Op = 0111)
        $display("\n--- OPERACAO OR LOGICO (Sel_Op = 0111) ---");
        A = 8'b11110000;
        B = 8'b10101010;
        Sel_Op = 4'b0111;
        #10;
        $display("OR: %b OR %b = %b (esperado: 11111010)", A, B, Resultado[7:0]);
        
        // Teste 10: NAND logico (Sel_Op = 1000)
        $display("\n--- OPERACAO NAND LOGICO (Sel_Op = 1000) ---");
        A = 8'b11110000;
        B = 8'b10101010;
        Sel_Op = 4'b1000;
        #10;
        $display("NAND: %b NAND %b = %b (esperado: 01011111)", A, B, Resultado[7:0]);
        
        // Teste 11: NOR logico (Sel_Op = 1001)
        $display("\n--- OPERACAO NOR LOGICO (Sel_Op = 1001) ---");
        A = 8'b11110000;
        B = 8'b10101010;
        Sel_Op = 4'b1001;
        #10;
        $display("NOR: %b NOR %b = %b (esperado: 00000101)", A, B, Resultado[7:0]);
        
        // Teste 12: XOR logico (Sel_Op = 1010)
        $display("\n--- OPERACAO XOR LOGICO (Sel_Op = 1010) ---");
        A = 8'b11110000;
        B = 8'b10101010;
        Sel_Op = 4'b1010;
        #10;
        $display("XOR: %b XOR %b = %b (esperado: 01011010)", A, B, Resultado[7:0]);
        
        // Teste 13: NOT logico (Sel_Op = 1011)
        $display("\n--- OPERACAO NOT LOGICO (Sel_Op = 1011) ---");
        A = 8'b11110000;
        B = 8'b00000000;
        Sel_Op = 4'b1011;
        #10;
        $display("NOT: NOT %b = %b (esperado: 00001111)", A, Resultado[7:0]);
        
        // Teste 14: Comparacao - Maior
        $display("\n--- OPERACAO COMPARACAO ---");
        A = 8'd50;
        B = 8'd30;
        Sel_Op = 4'b0000;
        #10;
        $display("Comparacao: %d > %d ? Maior=%b, Menor=%b, Igual=%b", A, B, Maior, Menor, Igual);
        
        // Teste 15: Comparacao - Menor
        A = 8'd20;
        B = 8'd80;
        Sel_Op = 4'b0000;
        #10;
        $display("Comparacao: %d < %d ? Maior=%b, Menor=%b, Igual=%b", A, B, Maior, Menor, Igual);
        
        // Teste 16: Comparacao - Igual
        A = 8'd42;
        B = 8'd42;
        Sel_Op = 4'b0000;
        #10;
        $display("Comparacao: %d == %d ? Maior=%b, Menor=%b, Igual=%b", A, B, Maior, Menor, Igual);
        
        $display("\n===== TESTES CONCLUIDOS =====");
        $finish;
    end

endmodule
