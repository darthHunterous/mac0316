## 7.2 - Abstração de Processos
* Tal abstração deve esconder os passos computacionais necessários para a solução
* Abstrações sobre mapeamento de domínios podem ser representadas por funções

### 7.2.1 - Funções
* Computacionalmente, representa-se funções através de uma expressão que denota o mapeamento entre o domínio e imagem da função. A aplicação da função resulta no elemento da imagem relacionado ao elemento dado do domínio
* **Definição função em Pascal**
    * `function F(P1; ...; Pn) : T; <bloco>`
        * F é identificador da função
        * Pi são os parâmetros
        * T é o tipo do resultado
        * `<bloco>` contém declarações e comandos para o comportamento esperado da função
    * Função que calcula potência
        ```Pascal
        function pot (x:Real; n:Integer) : Real;
          begin (* assumindo n > 0 *)
            if n = 1 then pot := x
                     else pot := x * pot(x, n-1)
          end
        ```
* **Definição Função em C**
    * `T F (P1, ..., Pn) <bloco>`
        * T tipo do resultado da função
        * F identificador
        * Pi parâmetros
        * bloco, comandos que implementam a função
    * Função potência em C
        ```C
        float pot(float x, int n) {
            /* assumindo n > 0 */
            float potencia;
            if (n == 1)
                return x;
            else
                return x * pot(x, n-1);
        }
        ```
        * Não há necessidade de criar variáveis locais para guardar o valor potência em cada chamada recursiva pois as expressões são empilhadas nas chamadas recursivas
* **Potência em SML**
    ```SML
    fun pot (x: real, n:int) = if n=1 then x
                                      else x * pot(x, n-1)
    ```

### 7.2.2 - Procedimentos
* Abstrações de procedimentos: série de comandos que provocam mudanças sucessivas nos valores das variáveis
* **Procedimento em Pascal**
    * `procedure P (PF1, ..., PFn); <bloco>`
        * P identificador
        * PFi parâmetros
        * bloco: comandos que descrevem o comportamento do procedimento
* **Procedimento em C**
    * `void P (PF1, ..., PFn) <bloco>`
    * Em C, procedimentos e funções são unificados como funções, porém procedimentos em C seriam equivalentes a funções do tipo `void`
* Em SML não há procedimentos de maneira explícita pois em linguagens funcionais, funções recursivas são usadas para resolver os problemas. O recurso de procedimentos poderia ser alcançado através do uso de `ref`, variáveis de referência