# 5.1 - Vinculações

* **Vinculação**: associação de entidades (variáveis, funções) de um programa a atributos relativos no contexto do programa (valor, tipo, estrutura, abstração)
    * Entidades só podem ser processadas quandos os atributos estão definidos de maneira exata, através de **vinculação**
* **Declaração de Variáveis**
    * **Vinculação** de identificadores a espaços de memória para guardar valores de um dado tipo
* **O que** pode ser vinculado, **de que forma** e **quando**
* **Tempo de vinculação:** momento em que a vinculação se desenvolve
* **Forma de vinculação:** como os atributos se associam às entidades
* **Elementos vinculáveis (o que)**
    * Tipos, referências e valores a identificadores de variáveis
    * Valores a identificadores de constantes
    * Valores e estruturas a identificadores de tipos
    * Abstrações de processos a identificadores de funções e procedimentos
    * Abstrações de tipos de dados a identificadores de tipos ou classes
<br><br>
### 5.1.1 - Formas de Vinculação
* Tipos predefinidos são vinculados a priori nas respectivas palavras reservadas
* **Definição de um novo tipo em C**
    * Criação de uma nova estrutura (struct)
    * Definição de um novo identificador de tipo a um elemento já existente (typedef)
* **Declaração Explícita de Novos Elementos**
    * Vincula-se um identificador a cada novo elemento de forma explícita permitindo uso similar a tipos predefinidos
    * Flexibilidade
* Variáveis armazenam valores de tipos determinados
    * A vinculação determina o universo de valores armazenáveis em uma variável
* **Declaração Explícita**
    * Lista de nomes de variáveis e tipo associado
* **Declaração Implícita**
    * Tipo da variável inferido em vez de declarado
    * **Exemplo em Fortran**: variáveis não explicitamente declaradas são do tipo inteiro se o identificador começa com I ou N, e do tipo real em caso contrário
    * **Exemplo de Perl:** identificadores que comecem com $ são escalares que armazenam cadeia de caracteres ou valores numéricos, com @ são arrays e com % são estruturas
* **Vinculação de variáveis a espaços de memória**
    * Onde o conteúdo será armazenado
    * Variáveis locais e globais têm um espaço de memória vinculado ao identificador da variável de acordo com sua declaração no programa, explícita ou implicitamente
    * Variáveis heap têm sua vinculação ao espaço de memória de acordo com o comando de alocação explícito durante a execução do programa
<br><br>
### 5.1.2 - Tempo de Vinculação
* **Quando** vinculações são realizadas
    * **Vinculação estática:** ocorre antes do tempo de execução e não se altera ao longo dele
    * **Vinculação Dinâmica:** ocorre ou se modifica durante o tempo de execução
* Nos tipos predefinidos, vinculações estão embutidas nos processadores das linguagens. Para novos tipos construídos pelo programador, a vinculação é estática
* **Tempo de vinculação estático:**
    * Tipos definidos em tempo de compilação
    * Usada na maioria das linguagens com declaração explícita de tipos
    * Operações sobre variáveis são verificadas com relação aos tipos em tempo de compilação
* **Tempo de vinculação dinâmico:**
    * Valores com tipo fixo porém variáveis e parâmetros não possuem tipo predeterminado
    * Variáveis podem assumir valores de tipos diferentes em diferentes estágios do programa
    * **Exemplo**
        * Linguagem APL
            * list <- 15.8 5.7 3.2
            * list <- 10
        * No primeiro exemplo, trata-se de um array de reais. No segundo exemplo, list é uma variável do tipo inteiro
    * Uma **vantagem** é a flexibilidade
    * **Desvantagens** 
        * Erros de mistura indevida de tipos não podem ser detectados pelo compilador
        * Atribuições equivocadas podem não resultar em erros em tempo de execução
        * Custo de implementação, pois os tipos devem ser verificados durante execução, degradando desempenho
    * Cada variável deve ter um descritor do tipo atual e o armazenamento deve ser gerenciado em tempo de execução
    * Java vincula objetos estaticamente quando há declaração explícita e dinamicamente para objetos genéricos