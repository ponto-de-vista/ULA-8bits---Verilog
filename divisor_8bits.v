module divisor_8bits(A, B, Q, R);
    input [7:0] A, B;
    output [7:0] Q;
    output [7:0] R;
    
    // Divisor com restauração simples
    // Para evitar problemas de síntese, usaremos operadores básicos
    wire [15:0] produto_temp;
    wire [7:0] q_temp, r_temp;
    integer i;
    reg [15:0] temp_A;
    reg [7:0] temp_Q;
    
    // Implementação básica: usa divisão direta
    // Para síntese, precisamos usar operadores de divisão
    always @(*) begin
        if (B == 8'b0) begin
            // Divisão por zero
            temp_Q = 8'hFF;
        end else begin
            // Realizar divisão iterativa
            temp_A = {8'b0, A};
            temp_Q = 8'b0;
            
            for (i = 7; i >= 0; i = i - 1) begin
                temp_Q = temp_Q << 1;
                temp_A = temp_A << 1;
                
                if (temp_A[15:8] >= B) begin
                    temp_A = temp_A - (B << 8);
                    temp_Q[0] = 1'b1;
                end
            end
        end
    end
    
    assign Q = temp_Q;
    assign R = (B == 8'b0) ? 8'b0 : A - (temp_Q * B);

endmodule
