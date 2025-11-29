# ULA com 8 Bits

Uma Unidade Lógica e Aritmética (ULA) completa de 8 bits implementada em Verilog, com suporte para operações aritméticas, lógicas e comparações.

## 📋 Descrição

Este projeto implementa uma ULA de 8 bits seguindo metodologia academica, com foco em:
- **Operacoes Aritmeticas**: Soma, subtracao, multiplicacao e divisao
- **Operacoes Logicas**: AND, OR, NAND, NOR, XOR e NOT
- **Comparador**: Compara dois numeros (maior, menor, igual)

## 🎯 Arquitetura

### Módulos Implementados

#### Operações Básicas
- `porta_and.v` - Porta AND lógica
- `porta_or.v` - Porta OR lógica
- `porta_nand.v` - Porta NAND lógica
- `porta_nor.v` - Porta NOR lógica
- `porta_xor.v` - Porta XOR lógica
- `porta_not.v` - Porta NOT lógica

#### Operações Aritméticas
- `meio_somador.v` - Somador de 1 bit
- `somador_completo.v` - Somador completo de 1 bit
- `somador_8bits.v` - Somador de 8 bits com ripple carry
- `meio_subtrator.v` - Subtrator de 1 bit
- `subtrator_completo.v` - Subtrator completo de 1 bit
- `subtrator_8bits.v` - Subtrator de 8 bits

#### Operações Avançadas
- `multiplicador_8bits.v` - Multiplicador usando algoritmo **Shift-and-Add** (Ndjountche, 2016)
- `divisor_8bits.v` - Divisor usando algoritmo de **Restauracao do Dividendo** (Ndjountche, 2016)
- `comparador_8bits.v` - Comparador de dois números de 8 bits

#### Módulo Principal
- `ula_8bits.v` - ULA principal que integra todas as operacoes

## 🔧 Seletor de Operacao (Sel_Op)

A ULA utiliza um seletor de 4 bits para escolher a operacao desejada:

| Sel_Op | Operacao | Resultado |
|--------|----------|-----------|
| `0000` | Soma | A + B |
| `0001` | Subtracao | A - B |
| `0010` | Multiplicacao | A × B (16 bits) |
| `0011` | Divisao (Quociente) | A ÷ B |
| `0100` | Divisao (Resto) | A mod B |
| `0110` | AND logico | A AND B |
| `0111` | OR logico | A OR B |
| `1000` | NAND logico | A NAND B |
| `1001` | NOR logico | A NOR B |
| `1010` | XOR logico | A XOR B |
| `1011` | NOT logico | NOT A |

## 📊 Sinais da ULA

### Entradas
- `A [7:0]` - Primeiro operando (8 bits)
- `B [7:0]` - Segundo operando (8 bits)
- `Sel_Op [3:0]` - Seletor de operacao (4 bits)

### Saidas
- `Resultado [15:0]` - Resultado da operacao (16 bits)
- `Maior` - Flag: A > B
- `Menor` - Flag: A < B
- `Igual` - Flag: A == B

## 🚀 Como Usar

### Compilacao e Simulacao

#### Com Icarus Verilog:

```bash
cd "ULA - CIRCUITOS"
iverilog -o ula_test porta_not.v porta_and.v porta_or.v porta_nand.v porta_nor.v porta_xor.v meio_somador.v somador_completo.v somador_8bits.v meio_subtrator.v subtrator_completo.v subtrator_8bits.v multiplicador_8bits.v divisor_8bits.v comparador_8bits.v ula_8bits.v ula_8bits_tb.v
vvp ula_test
```

#### Com EDAPlayground Online:
1. Acesse [EDAPlayground](https://edaplayground.com/)
2. Copie todos os arquivos `.v`
3. Selecione Icarus Verilog como simulador
4. Clique em "Run"

## ✅ Testes

O projeto inclui um testbench completo (`ula_8bits_tb.v`) que testa todas as operacoes:

```
===== TESTE DA ULA 8 BITS =====
Soma: 50 + 30 = 80 ✓
Soma: 20 + 15 = 35 ✓
Subtracao: 100 - 30 = 70 ✓
Multiplicacao: 12 * 15 = 180 ✓
Divisao: 100 / 5 = 20 ✓
AND: 11110000 AND 10101010 = 10100000 ✓
... e mais operacoes
```

## 📚 Algoritmos Implementados

### Multiplicador - Shift-and-Add
Baseado em Ndjountche (2016, p. 136-137):
- Gera produtos parciais usando portas AND
- Desloca cada produto conforme o bit multiplicador
- Soma todos os produtos usando árvore de somadores
- Resultado de 16 bits para dois operandos de 8 bits
- Delay: τ = (2n − 3)τ_carry + (n − 1)τ_sum + τ_AND

### Divisor - Restauracao do Dividendo
Baseado em Ndjountche (2016, p. 144):
- Realiza 8 iteracoes (para dividendo de 8 bits)
- A cada iteracao: desloca, subtrai e testa o resultado
- Se resultado ≥ 0, mantém; senão restaura
- Bit do quociente = inverso do borrow
- Retorna quociente e resto

## 📖 Referências

- **Ndjountche, Tertulien** (2016). *VLSI Design of Arithmetic and Logic Units*. Springer. p. 136-144.

## 🎓 Aplicacoes

Este projeto é ideal para:
- Estudos em Arquitetura de Computadores
- Cursos de Eletronica Digital
- Projetos de Circuitos Logicos
- Pesquisa em Design de ULAs

## 📝 Estrutura de Arquivos

```
ULA-com-8-bits/
├── README.md
├── porta_not.v
├── porta_and.v
├── porta_or.v
├── porta_nand.v
├── porta_nor.v
├── porta_xor.v
├── meio_somador.v
├── somador_completo.v
├── somador_8bits.v
├── meio_subtrator.v
├── subtrator_completo.v
├── subtrator_8bits.v
├── multiplicador_8bits.v
├── divisor_8bits.v
├── comparador_8bits.v
├── ula_8bits.v
└── ula_8bits_tb.v
```

## 🤝 Contribuicoes

Sinta-se livre para fazer fork, melhorias e pull requests!

## 📄 Licenca

MIT License - Veja LICENSE para detalhes.

## ✨ Autor

Desenvolvido como projeto academico em Eletronica Digital.

---

**Status**: ✅ Completo e testado
**Versao**: 1.0
**Ultima atualizacao**: 29/11/2025