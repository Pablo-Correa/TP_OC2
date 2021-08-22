# TODO:
* (OK) Remover o módulo Ram32, de forma que funcione de forma mais simples, apenas 
como uma lista de instruções
    * Ele é usado em dois locais: no FETCH para memória de instruções e no
    MEM_1 para memória de dados
* Transformar o decode para que leia instruções do RISCV e não do MIPS. Talvez
envolva mexer no controle também
* Remover as funções de branch, não são necessárias nesse projeto
* Control deve ler funct7, funct3 e opcode
* Colocar os estágios de execução com 4 etapas, seja da ALU, seja de memória, 
seja de multiplicação (que já são 4 por padrão).
* Fazer os encaminhamentos (grande)

# Observações
* Muitas variáveis tem nome "xx_yy_variable", o "xx" é um estágio e o "yy" é 
outro muitas das vezes. Por exemplo, "if_id_instruc" é uma variável que leva 
a instrução lida no Instruction Fetch (IF) para o Instruction Decode (ID).
* Na scoreboard, cada entrada tem 8 bits ([7:0]):
    * Pendente ou não: [7]
    * Em qual unidade funcional está: [6:5]
    * Status (aqueles 1's andando): [4:0] 

# Instruções de Compilação/Execução e Testes
* Para compilar o processador e as testbenches rode o *build.sh*
        bash build.sh
* Para executar um teste e gerar um arquivo *.vcd* para análise das ondas no ~
GTKWave, fique na pasta raiz do projeto e invoque o *vvp* no arquivo compilado
daquela testbench
        vvp build/mips_dd_tb0.out
O arquivo *.vcd* estará na pasta raiz também. Lembre-se de verificar as saídas
impressas na tela, para checar se não ocorreu algum erro de leitura de algum
arquivo (pode acontecer quanto aos caminhos).