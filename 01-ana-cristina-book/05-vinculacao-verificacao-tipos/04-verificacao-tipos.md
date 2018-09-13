# 5.4 - Verificação de Tipos
* **Verificação de Tipos:** assegurar que os operandos sejam de tipos compatíveis
    * **Tipo Equivalente (Compatível):** válido para o operador ou tem permissão de ser convertido automaticamente para um tipo válido (**coerção de tipos**)
    * **Erro de Tipo:** uso indevido de operadores com operandos
* Se as vinculações de tipos são realizadas estaticamente, a verificação de tipos pode ser feita estaticamente em tempo de compilação
    * Com vinculação dinâmica, os tipos devem ser verificados em tempo de execução
* O custo computacional da verificação estática é menor que a dinâmica, porém menos flexível
<br><br>
### 5.4.1 - Equivalência de Tipos
* **Compatibilidade de tipos:** definida por equivalência de nomes
    * Se ambas variáveis são declaradas com o mesmo tipo
    * **Definição 5.3:** tipos de dados nominalmente equivalentes
        * Dado dois tipos T e T'
        * São nominalmente equivalentes se e somente se T = T' (mesmo nome)
    * Se a equivalência de tipos é definida pela equivalência nominal, cada novo tipo só pode ser equivalente a ele mesmo
        * Exemplo
        ```Pascal
        type Int1 = Integer;
             Int2 = Integer;
        var v1: Int1;
            v2: Int2;
        ```
        * Considerando equivalência de nomes, as variáveis v1 e v2 não possuem tipos equivalentes já que são declaradas por tipos nominalmente diferentes, mesmo que o possuam o mesmo tipo base
* **Operandos de tipos diferentes:**
    ```C
    int i; /* Tipo T */
    float f1, f2; /* Tipo T' */
    ...
    f1 = i + f2; /* T' = T + T' (tipos) */
    ```
    * **Equivalência Estrutural:**
        * **Definição 5.4:** dado dois tipos de dados T e T', são estruturalmente equivalentes (T &equiv; T') se e somente se ambos têm o mesmo conjunto de valores
    * Verificar cada um dos valores para equivalência estrutural seria impossível pois boa parte deles faz parte de um conjunto infinito, portanto a verificação pode ocorrer através da redução dos tipos para elementos bases
* **Verificação de Equivalência de Tipos:**
    * T e T' são primitivos. Então T &equiv; T' se e somente se T e T' são idênticos
    * T = A x B e T' = A' x B'. Então, T &equiv; T' se e somente se A &equiv; A' e B &equiv; B'
    * T = A + B e T' = A' + B'. Então, T &equiv; T' se e somente se A &equiv; A' e B &equiv; B' ou A &equiv; B' e B &equiv; A'
    * T = A &rarr; B e T' = A' &rarr; B'. Então, T &equiv; T' se e somente se A &equiv; A' e B &equiv; B'
    * Em qualquer outro caso, T e T' não são equivalentes
* Tal verificação acima se torna complexa com definição por tipos recursivos
* Exemplo em C
    * Equivalência estrutural para os tipos, equivalência de declarações para estruturas
* **Coerção de Tipos:** mapeamento de valores de um tipo para valores de outro automaticamente
    * Incompatível com sobrecarga e polimorfismo
    * Apenas permitida quando o mapeamento entre valores é claro
<br><br>
### 5.4.2 - Inferência de Tipos
* SML emprega o mecanismo de inferência
    * Determina tipos a partir das expressões e operadores usados
* <code>fun circunf(r) = 3.14 * r * r;</code>
    * Como uma constante real é utilizada, o sistema de inferIencia pode concluir que os outros elementos também são reais, produzindo um resultado real
* Outro exemplo
    * <code>fun segundo (x, y) = y</code>
    * (&alpha; x &gamma;) &rarr; &gamma;
    * Dá como resultado o segundo argumento para quaisquer tipos, inclusive distintos entre si
* Porém, SML rejeita expressões em que não se possa inferir os tipos
    * <code>fun quadrado(x) = x * x; {erro}</code>
    * x não foi declarado, então o sistema de inferência tenta descobrir o tipo, mas como o operador de multiplicação pode ser utilizado tanto para inteiros quanto para reais, não consegue concluir
    * Tal expressão seria aceita se o tipo do parâmetro fosse definido
        * <code>fun quadrado1(x: int) = x * x;</code>
        * <code>fun quadrado2(x) = (x:int) * x;</code>
        * <code>fun quadrado3(x) = x * (x:int);</code>
        * <code>fun quadrado4(x) = (x:int) * (x:int);</code>