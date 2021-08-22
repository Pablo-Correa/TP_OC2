/**
 * Testbench 0 - Esqueleto e ALU
 * Este testbench básico realiza testes aritméticos, realizando várias adições.
 * Sua função principal é garantir que o esqueleto dos testbenches esteja fun-
 * cionando corretamente, assim como testar instruções básicas da ALU, necessá-
 * rias para o bom funcionamento de qualquer outro programa. São monitorados os
 * sinais de entrada da ALU, do opcode e da saída desse módulo
 */

`include "./src/Mips.v"

module Mips_TB;
    reg clock, reset;

    reg [4:0] reg_out_id;
    wire [31:0] reg_out_data;

    integer cur_time;

    Mips mips(
        .clock(clock),
        .reset(reset),
        .reg_out_id(reg_out_id),
        .reg_out_data(reg_out_data),
        .fetch_ram_load(1'b0),
        .mem_ram_load(1'b0)
    );

    initial begin
        // Coloca as instruções do arquivo na estrutura de memória de instruções
        #10 $readmemh("./tb/mips_dd_tb0.hex", 
                      mips.FETCH.instruction_memory.mem);
        // Faz o dump das formas de onda para análise posterior
        $dumpfile("mips_dd_tb0.vcd");
        $dumpvars;

        // Imprime na tela alguns sinais escolhidos
        $display("\tTime\t\t0\t1\t2");
        $monitor("%d\t%d%d%d", cur_time,
            mips.REGISTERS.registers[0],
            mips.REGISTERS.registers[1],
            mips.REGISTERS.registers[2]
        );

        // Termina depois de 100 ticks
        #100 $finish;
    end

    initial begin
        cur_time = $time;
        clock <= 0;
        reset <= 1;
        #2 reset <= 0;
        #2 reset <= 1;
    end

    always begin
        #3 clock <= ~clock;
        cur_time = $time;
    end

endmodule
