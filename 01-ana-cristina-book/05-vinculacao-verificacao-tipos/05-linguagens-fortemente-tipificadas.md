# 05 - Linguagens Fortemente Tipificadas
* Capazes de reconhecer todos os erros de tipos, sendo o programador advertido em tempo de compilação ou execução
* Os tipos de todos os operandos devem ser determinados durante a compilação ou execução, permitindo a detecção em tempo de execução ao utilizar valores com tipos incorretos para variáveis que possam armazenar valores com mais de um tipo
* Pascal e Modula-2 não são totalmente fortemente tipificadas, pois na união disjunta, o tipo usado pode ser omitido, deixando de se realizar verificação em tempo de execução
* C e C++ não são fortemente tipificadas pois permitem existência de funções não verificadas quanto ao tipo. Ademais, a união disjunta permite o uso de tipos diferentes em um mesmo espaço de memória, sem verificação
* SML é fortemente tipificada. Todos identificadores são vinculados estaticamente a partir da declaração ou reconhecidos a partir das regras de inferência