# 5.3 - Sistema de Tipos
* Na maioria das linguagens, a vinculação de tipos às variáveis é realizada estaticamente. Nesse caso, a verificação de tipos é feita de forma trivial
    * Sistema de tipo chamado **monomórfico**
* Sistemas de tipos monomórficos são insatisfatórios pensando em **reutilização de software**
    * Algoritmos genéricos poderiam ser usados com diferentes tipos, porém para sistemas puramente monomórficos, há necessidade de se reescrever todo o algoritmo
* Estruturas de dados como listas, pilhas e filas podem ser descritas independentemente dos tipos, porém em sistemas de tipos monomórficos, elas precisam ser reescritas para diferentes tipos
* Sistemas de tipos com formas mais gerais de descrição precisam de conceitos como **sobrecarga (overloading)** e **polimorfismo**
    * **Sobrecarga (overloading):** capacidade de um identificador denotar várias abstrações ao mesmo tempo
    * **Polimorfismo:** abstrações para tratamento uniforme entre valores de diferentes tipos
<br><br>
### 5.3.1 - Monomorfismo
* **Sistema de Tipos Monomórfico:** cada elemento declarado possui único tipo
    * Usado em grande parte das linguagens imperativas
    * Constantes, variáveis, parâmetros e resultados de funções em Pascal e C. Tipos determinados na própria declaração
    * **Exemplo:** para usar inteiros e caracteres numa pilha em C ou Pascal, a estrutura precisa ser definida duas vezes bem como as operações sobre ela
        * Todos tipos de parâmetros e resultados de funções devem ser fixados na definição
        * Nem todas abstrações em tais linguagens são monomórficas. O comando write em Pascal, imprime valores de vários tipos (caso de sobrecarga)
<br><br>
### 5.3.2 - Sobrecarga
* Uso de um mesmo identificador para operações diferentes
    * Comandos de imprimir caracteres, inteiros, etc com o mesmo descritor
    * Sobrecarga de operadores, já que os operadores de soma e subtração podem ser usados tanto para inteiros quanto reais
    * A desambiguação ocorre através da análise dos operandos
* Algumas linguagens permitem declarações de abstrações com identificadores sobrecarregados. Tais abstrações podem ser **independentes de contexto** e outras dependem de onde se aplicam (**dependentes de contexto**)
* **Sobrecarga Independente de Contexto:** abstração dependente do tipo dos argumentos e não no contexto de sua aplicação
    * Por exemplo, em C a divisão de dois inteiros terá como resultado um inteiro não dependendo se a variável associada é inteiro ou real
        * <code>float x = 9 / 2;</code>
            * Tem como output 4.00 pois a divisão de inteiros é efetuada e o resultado truncado
        * <code>float x = (float) 9 / (float) 2;</code>
            * Tem como output 4.5
            * Neste caso, o operador de divisão continua independente do contexto, pois a conversão é aplicada diretamente nos operandos
    * **Definição 5.1:** forma para identificar qual abstração a ser usada na sobrecarga independente de contexto
        * Sendo **f1: S1 &rarr; T1** e **f2: S2 &rarr; T2** funções distintas. Tais funções podem usar o mesmo **identificador I**, numa **sobrecarga independente de contexto** se S1 e S2 são de tipos distintos.
            * I(E) usa f1 se E é do tipo S1 e f2 quando E é do tipo S2
* **Sobrecarga Dependente de Contexto:** abstração aplicada depende dos operandos e também do resultado esperado
    * Depende do tipo de variável a qual se atribui o resultado
    * **Exemplo em Ada:**
        ```Ada
        ...
        function "/" (m, n : Integer) return Float is
            begin
                return Float(m) / Float(n);
            end;
        ...
        a, b, n : Integer;
        x : Float;
        ...
        n = a / b; { divisão de inteiros atribuída a inteiro, uso do operador predefinido }
        x = a / b; { divisão de inteiros atribuída a real, uso do novo operador }
        ...
        ```
        * Ada também permite criação de funções distinguidas por paramêtros ou pelo resultad
    * **Definição 5.2:** restrições à sobrecarga dependente de contexto
        * **f1: S1 &rarr; T1** e **f2: S2 &rarr; T2** são funções distintas. Para **sobrecarga dependente de contexto**, tais funções podem usar o mesmo identificador I com S1 e S2 distintos ou T1 e T2 distintos
        * Se S1 e S2 são distintos, I(E) usa tal diferença entre argumentos para definir a aplicação
        * Se S1 e S2 são do mesmo tipo, I(E) usará f1 em um contexto que requeira tipo T1 (atribuição do resultado a variável de tipo T1) ou f2, no caso análogo para T2
<br><br>
### 5.3.3 - Polimorfismo
* Única abstração utilizada para uma família de tipos
* Operação uniforme sobre argumentos de tipos relacionados
* **Exemplo:** verificação de final de arquivo em Pascal
    * Recebe como argumento uma variável de arquivo de qualquer tipo, testando o final de arquivo e devolvendo um valor booleano
    * Não depende dos valores inseridos no arquivo, a função opera uniformemente para o teste de final de arquivo
* O Polimorfismo aumenta a expressividade da linguagem
    * Poder de tratamento genérico a uma família de tipos, aumentando a flexibilidade e reutilização de código
* Em POO, Polimorfismo permite que referências de classes mais abstratas representem o comportamento de classes concretas referenciadas
    * Duas ou mais classes diferentes com métodos de mesmo nome, sendo que uma função pode utilizar um objeto de qualquer de tais classes polimórficas, sem necessidade de tratamento diferenciado
* Pode ser aplicado a diferentes tipos de abstrações
    * Polimorfismo sobre abstrações de processos (funções genéricas)
    * Polimorfismo sobre tipos (tipos parametrizados ou politipos)
* **Polimorfismo de Abstrações:**
    * Polimorfismo na definição de funções
        * Pode-se definir funções com um tipo determinado ou deixar-se os parâmetros sem tipo determinado
    * **Exemplo em SML:**
        * <code>fun segundoint (x: int, y:int) = y</code>
            * Recebe dois inteiros e tem como resultado o segundo deles, com tipo segundoint
            * (inteiro x inteiro) &rarr; inteiro
                * Apenas argumentos de tipo inteiro podem ser aplicadas a tal função
        * Redefinindo para permitir tal aplicação a argumentos de qualquer tipo
            * <code>fun segundo (x, y) = y</code>
            * Função de tipo "segundo"
                * (&alpha; x &gamma;) &rarr; &gamma;
    * **Politipos:** tipos genéricos &alpha; e &gamma;, são instanciados com os tipos dos argumento de cada aplicação diferente na função
* **Tipos Parametrizados:** tipos que possuem outro tipo como parâmetro, tornando a definição de tipo polimórfica
    * Como exemplo, os **arrays**
        * Arrays podem ser instanciados para construir novos tipos a partir dos existentes
        * Arrays são tipos genéricos, que possuem outro parâmetro como tipo, podendo ser instanciado em outros tipos predefinidos nas linguagens
* Tempo de vinculação de variáveis com tipos monomórficos ou polimórficos   
    * Para linguagens puramente monomórficas, os tipos se vinculam às variáveis de maneira estática
    * Para tipos polimórficos ou sobrecarregados, certas vinculações dependem dos dados usado e portanto são realizadas em tempo de execução (vinculação dinâmica)