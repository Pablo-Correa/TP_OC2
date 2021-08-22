# TODO:
* Remover o módulo Ram32, de forma que funcione de forma mais simples, apenas 
como uma lista de instruções
* Transformar o decode para que leia instruções do RISCV e não do MIPS. Talvez
envolva mexer no controle também
* Remover as funções de branch, não são necessárias nesse projeto
* Control deve ler funct7, funct3 e opcode

# Observações
* Muitas variáveis tem nome "xx_yy_variable", o "xx" é um estágio e o "yy" é 
outro muitas das vezes. Por exemplo, "if_id_instruc" é uma variável que leva 
a instrução lida no Instruction Fetch (IF) para o Instruction Decode (ID).
* Na scoreboard, cada entrada tem 8 bits ([7:0]):
    * Pendente ou não: [7]
    * Em qual unidade funcional está: [6:5]
    * Status (aqueles 1's andando): [4:0] 
