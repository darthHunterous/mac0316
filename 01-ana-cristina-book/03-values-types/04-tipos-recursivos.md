# 3.4 - Tipos Recursivos

* Um problema comum é nos depararmos com situações em que não sabemos quantos elementos nossas listas terão a priori
* Dessa maneira, podemos representar listas por células com dois elementos, um guarda o valor e o outro é um apontador para uma lista de elementos do mesmo tipo
* Tipos recursivos são compostos por valores que possuem o próprio tipo como valor
* Um tipo lista de inteiros pode ser definido pela unidade base (lista vazia - Unit) junto com um inteiro seguido por uma lista de inteiros
    * <code>IntList = Unit + (Integer x IntList)</code>
    * IntList é usado para definir a si, logo, é um tipo recursivo
    * Seja **nil** a lista vazia e **cons** um construtor de lista (constrói uma lista a partir de um elemento **i** e uma lista **l**)
        * IntList = {nil} &cup; {cons(i, l) | i &isin; Integer, l &isin; IntList}
        * O tipo lista de inteiros é formado pela união da unidade base (nil) com todas as listas de inteiros de apenas um elemento, com todas as listas com dois elementos, etc
            * {nil}
            * &cup; {cons(i, nil) | i &isin; Integer}
            * &cup; {cons(i, cons(j, nil)) | i, j &isin; Integer}
            * ...
        * Dessa forma, pode-se obter um conjunto infinito de listas
* A **cardinalidade** de tipos recursivos é infinita, mesmo com um conjunto de valores finito, pois novos elementos podem sempre ser criados
* **Exemplo**
    * Conjunto A = {jan, fev, mar}
    * Listas passíveis de formação
        * &empty;
        * [jan], [fev], [mar]
        * [jan, jan], [jan, fev], [jan, mar]
        * [fev, jan], [fev, fev], [fev, mar]
        * [mar, jan], [mar, fev], [mar, mar]
        * ...
* **Exemplo - Lista de número Inteiros em Pascal**
    * Auxílio de apontadores
    ```Pascal
    type IntListP = ^ IntNode;
        int Node = record valor: Integer;
                          prox: IntListP
                   end;
    ```
    * Em Pascal, um tipo não pode ser definido usando seu próprio nome, portanto a necessidade de usar o elemento auxiliar IntListP
* **Lista de Inteiros em C - Exemplo**
    ```C
    typedef struct NoIntlist *IntListC;
    struct NoIntList {
        int valor;
        IntListC prox;
    }
    ```
* Linguagens funcionais possuem listas como tipos predefinidos (**list**)
    * Por consequência, apresenta operações básica predefinidas, como
        * **hd** -> primeiro elemento da lista
        * <code>**l**</code> -> lista sem pimeiro elemento
        * **length** -> tamanho da lista
    * **Exemplo de lista em SML**
        * 5::3::2::nil = 5::3::[2] = 5::[3, 2] = [5,3,2]
        * **nil** representa a lista vazia
        * **::** é um construtor que precisa de um elemento (à esquerda) e uma lista (à direita)s
        * Algumas operações
            * **Concatenação de listas**
                * [5, 3, 2]@ [7, 8];
                * &gt; [5, 3, 2, 7, 8] : int list
            * **Lista em ordem inversa**
                * rev [5, 3, 2];
                * &gt; [2,3 5] : int list
            * **Primeiro elemento da lista**
                * hd [5, 3, 2];
                * &gt; 5: int
            * **Descarta o primeiro elemento**
                * tl [5, 3, 2];
                * &gt; [3, 2] : int list
            * **Número de elementos da lista**
                * length [5, 3, 2];
                * &gt; 3 : int
        * **@** e **rev** fazem parte da linguagem
            * As outras operações podem ser implementadas através de elementos base, mas comumente já se encontram implementadas
    * **Exemplo de construção de novos tipos em SML**
        ```SML
        datatype IntlistS =   nil
                            | cons of int * IntlistS
        ```
        * nil representa a lista vazia e cons, o construtor
        * Na segunda linha, constrói-se (cons) uma nova lista com um valor inteiro (int) combinado (\*) com uma lista de inteiros (IntlistS)
            