`include "ula_8bits.v"

module ula_8bits_tb();
    reg [7:0] A, B;
    reg [3:0] Sel_Op;
    wire [15:0] Resultado;
    
    // Instancia a ULA (sem Maior, Menor, Igual)
    ula_8bits ula(.A(A), .B(B), .Sel_Op(Sel_Op), .Resultado(Resultado));
    
    initial begin
        $dumpfile("ula_8bits_tb.vcd");
        $dumpvars(0, ula_8bits_tb);

        $display("TESTE DA ULA 8 BITS:");
        
        //Soma (Sel_Op = 0000)
        $display("\nOPERACAO DE SOMA (Sel_Op = 0000):");
        A = 8'd50;
        B = 8'd30;
        Sel_Op = 4'b0000;
        #10;
        $display("Soma: %d + %d = %d", A, B, Resultado[7:0]);
        
        //Subtracao (Sel_Op = 0001)
        $display("\nOPERACAO DE SUBTRACAO (Sel_Op = 0001):");
        A = 8'd100;
        B = 8'd30;
        Sel_Op = 4'b0001;
        #10;
        $display("Subtracao: %d - %d = %d", A, B, Resultado[7:0]);
        
        //Multiplicacao (Sel_Op = 0010)
        $display("\nOPERACAO DE MULTIPLICACAO (Sel_Op = 0010):");
        A = 8'd3;
        B = 8'd90;
        Sel_Op = 4'b0010;
        #10;
        $display("Multiplicacao: %d * %d = %d", A, B, Resultado);
        
        //Multiplicacao maior
        A = 8'd20;
        B = 8'd20;
        Sel_Op = 4'b0010;
        #10;
        $display("Multiplicacao: %d * %d = %d", A, B, Resultado);
        
        //Divisao - Quociente (Sel_Op = 0011)
        $display("\nOPERACAO DE DIVISAO - QUOCIENTE (Sel_Op = 0011):");
        A = 8'd100;
        B = 8'd5;
        Sel_Op = 4'b0011;
        #10;
        $display("Divisao: %d / %d = %d", A, B, Resultado[7:0]);
        
        //Divisao - Resto (Sel_Op = 0100)
        $display("\nOPERACAO DE DIVISAO - RESTO (Sel_Op = 0100):");
        A = 8'd23;
        B = 8'd5;
        Sel_Op = 4'b0100;
        #10;
        $display("Divisao: %d mod %d = %d", A, B, Resultado[7:0]);
        
        //AND logico (Sel_Op = 0110)
        $display("\nOPERACAO AND LOGICO (Sel_Op = 0110):");
        A = 8'b11110000;
        B = 8'b10101010;
        Sel_Op = 4'b0110;
        #10;
        $display("AND: %b AND %b = %b", A, B, Resultado[7:0]);
        
        //OR logico (Sel_Op = 0111)
        $display("\nOPERACAO OR LOGICO (Sel_Op = 0111):");
        A = 8'b11110000;
        B = 8'b10101010;
        Sel_Op = 4'b0111;
        #10;
        $display("OR: %b OR %b = %b", A, B, Resultado[7:0]);
        
        //NAND logico (Sel_Op = 1000)
        $display("\nOPERACAO NAND LOGICO (Sel_Op = 1000):");
        A = 8'b11110000;
        B = 8'b10101010;
        Sel_Op = 4'b1000;
        #10;
        $display("NAND: %b NAND %b = %b", A, B, Resultado[7:0]);
        
        //NOR logico (Sel_Op = 1001)
        $display("\nOPERACAO NOR LOGICO (Sel_Op = 1001):");
        A = 8'b11110000;
        B = 8'b10101010;
        Sel_Op = 4'b1001;
        #10;
        $display("NOR: %b NOR %b = %b", A, B, Resultado[7:0]);
        
        //XOR logico (Sel_Op = 1010)
        $display("\nOPERACAO XOR LOGICO (Sel_Op = 1010):");
        A = 8'b11110000;
        B = 8'b10101010;
        Sel_Op = 4'b1010;
        #10;
        $display("XOR: %b XOR %b = %b", A, B, Resultado[7:0]);
        
        //NOT logico (Sel_Op = 1011)
        $display("\nOPERACAO NOT LOGICO (Sel_Op = 1011):");
        A = 8'b11110000;
        B = 8'b00000000;
        Sel_Op = 4'b1011;
        #10;
        $display("NOT: NOT %b = %b", A, Resultado[7:0]);
        
        //Comparador (0 para igual, 1 para menor e 2 para maior):
        //Comparacao - Maior
        $display("\nOPERACAO COMPARACAO (0 para igual, 1 para menor e 2 para maior):");
        A = 8'd50;
        B = 8'd30;
        Sel_Op = 4'b1100;
        #10;
        $display("Comparacao: %d > %d ? Resultado = %b", A, B, Resultado[1:0]);
        
        //Comparacao - Menor
        A = 8'd20;
        B = 8'd80;
        Sel_Op = 4'b1100;
        #10;
        $display("Comparacao: %d < %d ? Resultado = %b", A, B, Resultado[1:0]);
        
        //Comparacao - Igual
        A = 8'd42;
        B = 8'd42;
        Sel_Op = 4'b1100;
        #10;
        $display("Comparacao: %d == %d ? Resultado = %b", A, B, Resultado[1:0]);
        
        $display("\nTESTES FINALIZADOS");
        $finish;
    end

endmodule
