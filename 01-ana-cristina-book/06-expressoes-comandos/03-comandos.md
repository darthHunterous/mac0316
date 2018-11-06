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