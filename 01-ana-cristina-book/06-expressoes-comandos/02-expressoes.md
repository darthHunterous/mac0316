# Capítulo 06 - Expressões e Comandos
## 6.2 - Expressões
* Elementos de transformação de dados
* Atuam sobre valores, recebendo e produzindo valores

### 6.2.1 - Expressão como Valor
* Como expressões representam valores
* **6.2.1.1 - Literais:** denotam valor fixo
    * 5 valor cinco do tipo inteiro
    * 5.0 valor cinco de tipo real
    * 'a' caracter a em C
    * tipos enumerados (novos valores considerados como literais)
* **6.2.1.2 - Agregação de Valores:** constroem valores compostos a partir de valores mais simples
    * Array em C: `int n[5] = {32, 45, 66, 23, 58};`
    * Agregação em Perl é mais flexível, sem predefinir tipos e quantidade de elementos
        * Array de dois elementos que associa string a um inteiro
        * `%salarios = ("Maria" => 750, "Pedro" => 100);`
        * Tipo e tamanho inferidos dos valores
* **6.2.1.3 - Aplicação de Funções:** função computa o resultado da aplicação de uma abstração a um conjunto de argumentos
    * F(PA), onde F é o identificador da função e PA o parâmetro atual
    * PA apenas valores específicos
    * Em linguagens funcionais podem ser outras funções
    * Operadores predefinidos sobre tipos primitivos podem ser considerados aplicações de funções
* **6.2.1.4 - Expressões Condicionais:** assumem valores diferentes de acordo com uma condição
    * Função em SML que recebe dois inteiros e devolve o maior deles
        * `fun maior (x:int, y:int) = if x > y then x else y;`
    * Operador Ternário em C, C++ e Java
        * `<expressao1> ? <expressao2> : <expressao3>`
        * \<expressao1\> é condicional, se verdadeira resulta em \<expressao2\>, caso falsa, \<expressao3\>
* **6.2.1.5 - Valores associados a Identificadores:**
    * Várias linguagens permitem definir valores constantes a nome, calculados diretamente
    * Variáveis, por sua vez devem ter valor recuperado quando são usadas, de acordo com o estado do programa
    * Acesso ao valor de constante ou variável é o cálculo de uma expressão: valor a partir de identificador

### 6.2.2 - Avaliação de Expressão
* Ordem de avaliação e efeitos colaterais da avaliação de uma expressão que resulta no cálculo da expressão dados os valores
* **6.2.2.1 - Ordem de Avaliação:** depende da precedência de operadores, parênteses e ordem de avaliação dos operandos
    * Expressões aritméticas têm operadores binários de multiplicação e divisão com prioridade igual, mas com maior prioridade que soma e subtração
    * Operadores unários têm prioridade maior que binários
    * Operadores associativos de mesma prioridade tem resultado da expressão independente da ordem de avaliação
    * Na expressões lógicas da maioria das linguagens, o operador lógico com maior prioridade é o **NOT**, seguido de **AND**, seguido de **OR** e **XOR**
        * Ada trata todos operadores lógicos com mesma prioridade, portanto as expressões devem receber parênteses já que tais operadores não são associativos
    * Além de precedência natural de operadores e ordem de avaliação imposta por parênteses, a maioria das linguagens avalia expressões da esquerda para a direita (ordem de escrita)
    * **Avaliações Truncadas:** usado principalmente em expressões lógicas
        * `(x > 0 ) AND ((y/x) > 2)`
            * Se x for zero, há um erro de execução, porém se o processador da linguagem truncar a avaliação da expressão assim que o resultado puder ser inferido, x > 0 resulta falso, poranto a expressão completa seguirá sendo falsa, independentemente do segundo resultado
* **6.2.2.2 - Efeitos Colaterais:**
    * Expressões compostas por literais, constantes, variáveis ou que envolvam apenas os operadores aritméticos predefinidos com variáveis e literais não provocam mudanças no estado do programa
    * Quando a expressão contém aplicação de função, operações internas da função podem gerar mudanças no estado do programa (efeito colateral)
    * Um **exemplo** seria uma função que soma 10 ao valor de uma variável global nomeada x e retorna 10 como valor de retorno da função. O uso dessa função tem como efeito colateral a modificação do valor de x, portanto, a expressão `x + fun1();` gera resultados diferentes de acordo com a ordem de avaliação da expressão.
    * **Alternativas ao efeito colateral**
        * Projetista da linguagem pode impedir que a avaliação da função altera o valor da expressão
        * Definição de uma ordem de avaliação das expressões que deve ser seguida pelos processadores da linguagem
        * Proibir o uso de funções em uma expressão que modifique o valor de variáveis existentes na própria expressão