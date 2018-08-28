# 4.1 - Papel de Variáveis nos Programas

* Solução para cada problema passa por transformações sucessivas dos valores originais até obtermos os resultados desejados
* **Variável**
    * Objeto identificado por um "nome fantasia" que contém um valor, que pode ser consultado ou modificado
    * Armazenada em células de memória
        * O número de células usadas depende do tipo de dados e da linguagem de programação utilizada
    * Para cada variável, há o identificador, o endereço de memória onde é armazenada e o valor
    * **Exemplo em C**
        * int n;
            * Aloca uma célula de memória com o identificado n possuindo valor indefinido
        * n = 0;
            * Associa o valor zero como conteúdo
        * n = n + 1;
            * Avalia a expressão "n + 1" e depois modifica o conteúdo de n de acordo com o resultado da expressão
    * **Três subtarefas na declaração de uma variável**
        * Associar um tipo à variável
        * Alocar um espaço de memória adequado
        * Associar a tal espaço um identificador
    * O valor associado à variável não é determinado na declaração, mas na **atribuição**