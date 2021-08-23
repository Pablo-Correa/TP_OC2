/**
 * Testbench 2 - ADD e ADDI
 * 
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
        /* 
        Instruções:
        
        addi x10, x5, 7
        addi x11, x10, 8
        add x12, x10, x11
        
        */
        // Coloca as instruções do arquivo na estrutura de memória de instruções
        #10 $readmemh("../tb/riscv_tb2_adds.hex", 
                      mips.FETCH.instruction_memory.mem);
        // Faz o dump das formas de onda para análise posterior
        $dumpfile("riscv_tb2_adds.vcd");
        $dumpvars;

        // Imprime na tela alguns sinais escolhidos
        $display("\t\tA\taddrA\tB\taddrB\tOut\taddrRes\tAluOP");
        $monitor("\t%d%d%d\t%d", mips.ALUMISC.iss_am_rega, mips.ALUMISC.iss_am_rega mips.ALUMISC.iss_am_rega, mips.ALUMISC.aluout, mips.ALUMISC.iss_am_aluop);

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
