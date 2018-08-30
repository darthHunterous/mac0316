# 5.2 - Escopo Versus Vinculações

* **Escopo**: quais elementos são **visíveis** (podem ser acessadas) em uma determinada parte do programa
* Subprogramas com blocos, onde os elementos definidos são apenas vistos naquele escopo
* **Variável Local:** apenas definida e passível de uso dentro de um bloco específicio do programa
* **Variável Não-Local:** usadas dentro de um bloco do programa mas tendo sido definidas em um bloco mais externo
* Regras gerais de visibilidade de identificadores permite que as variáveis locais sejam visíveis nos blocos onde foram declaradas e também vistas como variáveis não-locais em blocos mais internos
* Programas são geralmente divididos em blocos distingos, que podem ser disjuntos ou aninhados
    * Porém, C, C++ e Java não permitem subprogramas definidos dentro de outros
* Quando a mesma variável é declarada em blocos aninhados, a regra de escopo determina que a variável considerada seja a de maior proximidade, ou seja, a variável local ou do aninhamento mais próximo
* A ideia de variáveis não-locais usadas na aplicação de blocos depende se a vinculação é de **escopo estático** ou **escopo dinâmico**
    ```
    program main;
        var x : integer;    #01
        procedure sub1;
            var x: integer; #02
            begin
                ...x...;    #03
            end;    // sub1
        procedure sub2;
            begin
                sub1;
                ...x...;    #04
            end;    // sub2
        begin   // main
            ...
        end;    // main
    ```
    * A variável x é definida dentro de sub1 em #02 e no programa principal em #01
        * O uso de x em sub1 (#03) é dado pela definição local
        * Porém o uso dentro de sub2 em #04 depende da vinculação de escopos
<br><br>
* **Escopo Estático:** relação entre blocos realizada em tempo de compilação
    * Regras de escopo indicam o uso de declarações do escopo mais interno par ao mais externo, respeitando a hierarquia
    * No exemplo acima, em caso de escopo estático, o x usado em sub2 será o definido na main, pois a main é o bloco pai do subprograma sub2
        * Hierarquia Sintática de Blocos
* **Escopo Dinâmico:** vinculação das variáveis ao escopo em tempo de execução
    * Segue a ordem de hierarquia de blocos com variáveis não-locais, porém considera o **pai dinâmico** ao invés do pai estático
    * **Pai-dinâmico:** definido pela proximidade de uso na sequência, última declaração em tempo de execução
    * No exemplo acima, embora sub2 seja estaticamente definido como sub-bloco da main, o uso de x dentro de sub2 vem após a chamada de sub1, portanto, o x vinculado ao escopo de sub2 é o último x usado (o declarado em sub1)
    * No escopo dinâmico, variáveis vinculadas ao escopo dependem da ordem de exeçução e não da ordem de declaração de blocos
    * Para uma variável não-local, a vinculação depende da ordem de execução e, como consequência, em um mesmo bloco um identificador pode ter significados diferentes
    * **Problemas:** legibilidade e eficiência