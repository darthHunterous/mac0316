# Capítulo 06 - Expressões e Comandos
## 6.3 - Comandos
* **Expressões:** responsáveis pela transformação de dados
* **Comandos:** responsáveis pelas mudanças de estados
    * **Comandos de Atribuição:** mudam o conteúdo de variáveis (estado) do programa
    * **Estruturas de controle no nível de instrução:** direcionam os passos subsequentes do programa

### 6.3.1 - Atribuição
* Responsáveis pela mudança explícita do estado do programa
* Linguagens com variáveis possuem comandos de atribuição
* **Atribuição Simples:** a expressão é avaliada e o valor resultante atribuído a uma única variável
    * Abreviações do comando de atribuição
        * `x++;` ou `x = x + 1;`
        * `x += y;` ou `x = x + y;`
        * `x = y++;` ou `y = y + 1; x = y;`
        * `x = ++y;` ou `x = y; y = y + 1;`
* **Atribuição Múltipla:** atribuição de um resultado de expressão a várias variáveis
    * Em PL/I: `x, y = 10`
    * Em C, C++ e Java: `x = y = 10.2`
        * Primeiro, 10.2 é atribuído a y e depois o valor de y é atribuído a x
* **Atribuição Inserida em Expressões:** C, C++ e Java permitem que expressões contenham atribuições
    * `x = a + (y = z / b++)`
        * Equivale a `b = b + 1; y = z; x = a + (y / b);`
    * `if ((x = y) > 10) ...`
        * Equivale a `x = y; if (x > 10) ...`

### 6.3.2 - Instruções Compostas e Blocos
* **Instruções Compostas:** coleção de comandos delimitados por início e fim a serem tratados como um único comando. Necessita ser executado em uma sequência determinada de instruções
    * Comando sequencial na ordem, com o separador `;`
    * Instruções compostas delimitados por delimitadores como `begin` e `end`
* **Blocos de Comando:** contêm declarações de variáveis locais e uma sequência de instruções
    * Em C, C++ e Java, chaves delimitam instruções compostas e blocos de comandos
    * Em Pascal, só os programas ou subrotinas são aceitos como blocos de comando

### 6.3.3 - Condicionais
* Instruções de seleção permitem escolher entre duas ou mais sequências de instruções possíveis
* **6.3.3.1 - Seleção Bidirecional:** presente em todas linguagens de programação atuais baseadas em comandos
    * Em Pascal:
        ```Pascal
        if <expressão_lógica>
            then <instrução_composta1>
            else <instrução_composta2>
        end;
        ```
* **6.3.3.2 - Seleção n-direcional:** generalização da bidirecional, onde n sequência podem ser seguidas ao invés de apenas duas
    * Em Pascal:**
        ```Pascal
        case <expressão> of
            <lista_de_literais1> : <instrução_composta1>;
            ...
            <lista_de_literaisn> : <instrução_compostan>;
            else <instrução_composgta_n+1>
        ```
        * `<expressão>` é de um tipo primitivo, sendo avaliada e seu resultado comparado com os literais de `<lista_de_literais>`, sendo executada a `<instrução_composta>` correspondente
        * Um mesmo literal não pode ser repetido em lista diferentes
        * Se nenhuma dos literais equivale à expressão, a opção `else` é usada (sendo esta opcional)
    * Exemplo de contagem do conjunto de vogais em Pascal
        ```Pascal
        case letra of
            'a', 'e' : begin
                         contae := contae + 1
                       end;
            'i', 'o' : begin
                         contio := contio + 1
                       end;
            'u'      : begin
                         contu := contu + 1
                       end;
            else       begin
                         contconsoantes = contconsoantes + 1
                       end
        ```
    * C, C++ e Java possuem seleção n-direcional mais restritiva, por meio do `switch`, já que a expressão só pode ser um inteiro
        ```C
        switch (expressão) {
            case <expressão_constante1> : <bloco1>;
            ...
            case <expressão_constanten> : <blocon>;
            default : <bloco_n+1>
        }
        ```
        * `<expressão>` deve ser um inteiro assim como `<expressões_constantes>`, se o valor de expressão for igual a uma ou mais expressões_constantes, seu bloco de código respectivo é executado. As constantes não precisam ser mutuamente exclusivas, já que mais de um bloco de código pode ser executado
        * `default` funciona de maneira similar ao `else` de Pascal
        * Boas práticas são trabalhar com alternativas exclusivas, finalizando o bloco de código correspondente com um `break` para evitar comparações extras
    * Exemplo na contagem de variáveis como par ou ímpar, no intervalo de inteiros de 1 a 2:
        ```C
        switch (numero) {
            case 1: contimpar = contimpar + 1;
                    break;
            case 2: contpar = contpar + 1;
                    break;
            default: printf("Fora do intervalo");
        }
        ```
    * Seleções n-direcionais podem ser reescritas de maneira bidirecional, porem as n-direcionais tornam o programa mais legível
    * Na maior parte das linguagens, expressões relacionais ou lógicas não são permitidas no uso dos casos possíveis em uma seleção n-direcional
* **Processamento Determinístico:** os comandos de seleção sempre executam as instruções correspondentes quando se encontram constantes de mesmo valor
* **Processamento Não-Determinístico:** definido por Dijkstra e implementado em Ada
    * Há um `if` e várias expressões lógicas alternativas em paralelo. Se mais de uma expressão for verdadeira, apenas um dos conjuntos de instrução é executado através de uma escolha não determinística

### 6.3.4 - Iterativos
* Permitem que um conjunto de instruções possa ser executado várias vezes
* São compostos por:
    * **Corpo do Comando:** conjunto de instruções a serem repetidas
    * **Controlador de laço:** expressão de controle que determina quando o corpo do comando deve seguir executando
* Classificação em relação ao **número de iterações:**
    * *Número predefinido de iterações*
    * *Número indeterminado de iterações*
<br><br>
* **6.3.4.1 - Número Predefinido de Iterações:** número de repetições a serem executadas definido a priori
    * **Variável de Controle:** inserida na expressão controladora, determina quantas vezes as instruções devem ser executadas
    * `for` em Pascal
        ```Pascal
        for <variável> := <expressão1> (to | downto)
                          <expressão2> do
                              <corpo_comando>
        ```
        * `expressão1` avaliada e atribuída a `variável`
        * `to`: variável comparada se menor ou igual a `expressão2`
        * `downto`: compara se maior ou igual
        * Em caso positivo, `<corpo_comando>` é executado
        * Comando prossegue com incremento/decremento (to/downto) de 1 da `variável` e execução do corpo do comando até que o valor da variável seja maior/menor que o de `expressão2`
    * Exemplo que imprime letras minúsculas ordenadas
        ```Pascal
        for c := 'a' to 'z' do
            write(c);
        ```
    * C, C++ e Java permitem a determinação do incremento a ser efetuado, além de que mais de uma variável de controle seja usada
        ```C
        for (<expressão1>; <expressão2>; <expressão3>) {
            <corpo_comando>
        }
        ```
        * `expressão1`: atribuição inicial às variáveis de controle
        * `expressão2`: conjunto de expressões lógicas sobre variáveis de controle
        * `expressão3`: progressão das variáveis
        * Inicialmente, realiza-se as as atribuições em expressão1, depois expressão2 é avalida e, se verdadeira, o corpo do comando é executado e após o término, os incrementos são realizados de acordo com expressão3
    * A modificação de variáveis de controle no corpo do comando não é proibida, mas trata-se de prática não recomendada
    * `for` pode ser usado como comando com número indefinido de iterações quando expressões 1 e 3 são omitidas, também não se trata de prática recomendada
<br><br>
* **6.3.4.2 - Número Indefinido de Iterações:** controlados por uma expressão lógica em vez de uma expressão de progressão predefinida
    * Em C, C++ e Java são representados por `while` e `do-while`
        * No while, a expressão lógica é avalidade e, se verdadeira, o corpo do comando é executado, até que a expressão passe a ser falsa. O comando do-while executa o corpo do comando e em seguida faz o teste da expressão, continuando apenas quando esta é verdadeira
    * Pascal possui `repeat-until` como alternativa para o `do-while`, porém a repetição é realizada enquanto a expressão for falsa
    * Ada possui apenas `while`

### 6.3.5 - Desvio Incondicional
* Transferem o controle da execução para um determinado local
* `goto` em Fortran
    * Uso de rótulos para determinar locais para os quais o desvio pode ser feito
    * Goto desconsidera outras estruturas de controle no programa, podendo gerar erros
    * Problemas com legibilidade, pois pode desviar o controle tanto para locais posteriores quanto para anteriores ao local atual
    * Modula-2 e Java não possuem goto, enquanto C sim
* `break` desvio incondicional para o fim de um bloco de comando