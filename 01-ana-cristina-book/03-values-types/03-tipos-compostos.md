# 3.3 - Tipos Compostos

* Não é possível se acessar partes de um valor atômico (tipo primitivo)
* **Tipos de Dados Compostos**
    * Conjuntos de dados em que cada elemento pode ser desmembrado em valores mais simples
    * A forma de agrupar valores em linguagens de programação são inspiradas em estruturas matemáticas com operações definidas sobre tais conjuntos
<br><br>
* **Estruturas Matemáticas**
    * **Produto Cartesiano de Dois Conjuntos**
        * Todos os pares formados pelos valores desses dois conjuntos, onde o primeiro elemento do par pertence ao primeiro conjunto, sendo análogo para o segundo elemento
        * **Exemplo**
            * Conjunto A = {jan, fev, mar} representa os três primeiros meses do ano
            * Conjunto B = {1, 2, 3} representa os três primeiros dias do mês
            * O produto cartesiano A x B representa todos as possíveis datas formadas com tal conjunto, ou seja
                * (jan, 1); (jan, 2); (jan, 3)
                * (fev, 1); (fev, 2); (fev, 3)
                * (mar, 1); (mar, 2); (mar, 3);
        * **Definições Formais**
            * Produto cartesiano do conjunto S pelo conjunto T
                * C = S x T = {(x, y) | x &isin; S, y &isin; T}
            * **Cardinalidade**
                * Números de elementos em um conjunto (#C)
                * #C = #S * #T
                * Se um dos conjuntos é infinito, então o produto cartesiano resultante também é um conjunto infinito
        * **Produto Cartesiano em Pascal**
            * <code>record</code>
            * Considerando <code>MesesP</code> e <code>DiasP</code> já definidos anteriormente, temos o seguinte código em Pascal
            ```Pascal
            type DataP = record
                            m: MesesP
                            d: DiasP
                         end;
            ```
        * **Produto Cartesiano em C**
            * <code>struct</code>
            ```C
            enum MesesC {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
            enum DiasC {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31};

            struct DataC {
                MesesC m;
                DiasC d;
            };
            ```
    * **União Disjunta**
        * Conjunto resultante contém todos so elementos dos dois conjuntos originais, podendo distinguir o conjunto de origem de cada elemento
        * **Exemplo**
            * Conjuntos A e B definidos anteriormente
            * Usaremos *prim* para discriminar elementos do primeiro conjunto e *seg* para elementos do segundo
            * União disjunta de A e B resulta em (A + B)
                * Onde tal tipo pode assumir um valor que representa um mês do primeiro trimestre tanto quanto assumir um valor que representa um dos três primeiros dias do mês
            * (A + B) = {prim jan, prim fev, prim mar, seg 1, seg 2, seg 3}
        * **Definição Formal**
            * União disjunta S + T dos conjuntos S e T, é definida por
                * C = S + T = {prim x | x &isin; S} &cup; {seg y | y &isin; T}
            * **Cardinalidade**
                * #C = #S + #T
        * Na união de conjuntos, quando os dois conjuntos possuem elementos iguais, apenas um é considerado no conjunto resultado
            * Na união disjunta, ambos elementos iguais são considerados, pois o uso do discriminador os torna diferentes
                * No exemplo acima, prim 1 e seg 1 são elementos diferentes
        * **União Discriminada**
            * Uma variável é responsável por discriminar o tipo
        * **Exemplo Pascal**
            * Novo tipo que discrimina entre valores inteiros (*exato*) e de ponto flutuante (*aprox*)
            * {..., exato -1, exato 0, exato 1, ...} &cup; {..., aprox -1.0..., aprox 0.,..., aprox 1.0, ...}
            ```Pascal
            type Precisao = {exato, aprox};
                NumeroP = record
                              case prec: Precisao of
                                  exato : (ival : Integer);
                                  aprox : (rval : Real);
                          end
            ```
            * Tal união disjunta discriminada é representada pelo record junto com o case
                * A variável prec terá um dos valores do tipo Precisao
                * Acesso às variáveis ival e rval, definidas em record, é feito através da verificação de prec
                    * Quando prec tem o valor exato, apenas ival deve ser usada
                    * Quando prec possuio valor aprox, apenas rval deve ser usada
                * Apenas um dos elementos de record pode ser usado, pois o espaço de memória é compartilhado por ival e rval dependendo do valor de prec
        * **União Livre em C - Exemplo**
            * Sem elemento discriminador
            ```C
            union NumeroC {
                int ival;
                float rval;
            }
            ```
            * Ao contrário da Struct, que define produtos cartesianos de subelementos, em uma union, apenas um dos elemento é acessível por vez
                * Um espaço de memória armazena ival e rval, sendo apenas um deles usável (o último com valor atribuído)
            * Mesmo sem elemento discriminador, as unions em C representam uma união disjunta pois caracteriza um novo conjunto em que os dois tipos estão contidos, sendo apenas um deles passível de utilização por vez
<br><br>
* **Estruturas Matemáticas - Mapeamentos**
    * O mapeamento de dois conjuntos resulta em um terceiro conjunto, onde o primeiro elemento advém do primeiro conjunto e o segundo elemento se origina do segundo conjunto
    * Ademais, cada elemento do primeiro conjunto se associa a, no máximo, um elemento do segundo conjunto
    * **Exemplo**
        * Conjunto A = {jan, fev, mar}
        * Conjunto B = {1, 2, 3}
        * Podemos ter vários mapeamentos formados
            * Um exemplo é o conjunto C = {jan &rarr; 1, fev &rarr; 2, mar &rarr; 3}
            * Outro exemplo é o conjunto D = {jan &rarr; 3, fev &rarr; 2, mar &rarr; 1}
        * **Definição Formal**
            * Mapeamento do conjunto S para o conjunto T denotado por S &rarr; T
                * m: S &rarr; T = {m | x &isin; S &rArr; m(x) &isin; T}
            * No mapeamento (ou função), o primeiro conjunto é o **domínio** (**índice** em linguagens de programação) e o segundo conjunto é o **contra-domínio** ou **imagem**
        * **Cardinalidade**
            * #(S &rarr; T) = (#T)<sup>#S</sup>
            * No exemplo acima, a cardinalidade, então, é dada por 3<sup>3</sup> = 27 mapeamentos diferentes
    * Em linguagens de programação, **mapeamentos de valores** são os **arrays**
    * **Mapeamento de inteiros no intervalo [0..15] - Pascal**
        * <code>var mapintP: array [0..15] of Integer;</code>
    * **Mapeamento de inteiros no intervalo [0..15] - C**
        * <code>int mapintC[16];</code>
    * Tais variáveis dos exemplos acima podem assumir qualquer mapeamento em {0, ..., 15} &rarr; {..., -1, 0, 1, ...}
        * Em Pascal, o conjunto de índices pode ser explicitamente definido, enquanto em C apenas o número de elementos no mapeamento é definido, já que o índice assume um inteiro de 0 a n-1
    * As funções construídas em linguagens de programação são mapeamentos não definidos, entre o domínio e o contra-domínio
        * Não são mapeamentos explícitos, como em arrays, sendo a relação descrita por um algoritmo entre os argumentos (domínio) e o resultado da função (imagem)
<br><br>
* **Estruturas Matemáticas - Conjuntos Potência**
    * Conjunto formado por todos os possíveis subconjuntos de um dado conjunto A
        * Nesse caso, o conjunto potência denota-se por &weierp;(A)
    * **Exemplo**
        * A = {jan, fev, mar}
        * &weierp;(A) = {&empty;, {jan}, {fev}, {mar}, {jan, fev}, {jan, mar}, {fev, mar}, {jan, fev, mar}}
    * **Definição Formal**
        * Conjunto Potência de um conjunto S, denota-se &weierp;(S), definido por:
            * &weierp;(S) = {s | s &sube; S}
            * Ou seja, todos subconjuntos que podem ser formados com os elementos de S
    * **Cardinalidade**
        * #(&weierp;(S)) = 2<sup>#S</sup>
    * **Exemplo em Pascal - Combinação de Cores Primárias**
        ```Pascal
        type Cores = (vermelho, azul, amarelo);
            NovasCores = set of Cores
        ```
        * NovasCores é o conjunto {{}, {vermelho}, {azul}, {amarelo}, {vermelho, azul}, {vermelho, amarelo}, {azul, amarelo}, {vermelho, azul, amarelo}}