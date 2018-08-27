# 02 - Tipos Primitivos

* Valores atômicos
    * Não podem ser desmembrados em valores mais simples
    * Implementação feita fora da linguagem de programação
    * Não há como descrever a constituição de um tipo primitivo usando elementos da própria linguagem
* Conjunto de números inteiros e reais nos domínios matemáticos
* A escolha de tipos primitivos se relaciona aos propósitos de criação da linguagem em si
    * Fortran, com caráter de solução para problemas científicos tem seu foco em número reais e sua precisão, número inteiros e complexos
    * Cobol, para processamento de dados comerciais, implementa cadeias de caracteres como tipo primitivo
    * MATLAB, resolução de problemas matemáticos relacionados à algebra de matrizes, portanto implementa matrizes como tipo primitivo
<br><br>
* **Tipos Primitivos Numéricos**
    * Inteiros
    * Reais
* **Tipos Primitivos Não-Numéricos**
    * Booleano
    * Caracteres
    * Apontadores
        * Indicam o valor de memória correspondente a uma variável
        * Usos
            * Acesso a endereçamento direto
            * Método de gerenciamento dinâmico de armazenamento (alocação dinâmica)
        * Apontador para inteiro em Pascal
            * <code>var intP : ^ Integer;</code>
        * Apontador para inteiro em C
            * <code>int *intC;</code>
* **Tipos Primitivos Enumerados**
    * Novos conjuntos de valores definidos pelos usuários através da enumeração de elementos
    * Enumeração em Pascal
        * <code>type MesesP = {jan, fev, mar, abr, mai, jun, jul, ago, set, out, nov, dez};</code>
    * Enumeração em C
        * <code>enum MesesC = {jan, fev, mar, abr, mai, jun, jul, ago, set, out, nov, dez};</code>
    * Os elementos da enumeração são tratados como valores
        * Mantêm a relação de ordem, permitindo comparação dos valores
        * Permitido atribuição do valor "jan" a uma variável do tipo MesesC, por exemplo
    * **Subintervalo de inteiros em Pascal**
        * <code>type DiasP = 1..31;</code>
        * Operações aritméticas e relacionais definidas para os inteiros também estão definidas para tal subconjunto
        * Subintervalos de tipos existentes não compõem um novo tipo, apenas uma restrição do já existente

    

