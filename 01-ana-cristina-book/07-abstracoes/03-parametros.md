## 7.3 - Parâmetros
* Para usar abstrações, faz-se necessário fornecer argumentos, dados para a aplicação
* A expressividade da abstração relaciona-se aos seus parâmetros
    * Uma função que calcule a potência de um dado número baseado em variáveis globais do programa requer que o programador tenha conhecimento sobre o uso de tais variáveis internamente na implementação da função
    * Se tal função for redefinida para receber tais dados como parâmetros, faz-se necessário apenas o fornecimento deles e não o conhecimento quanto as variáveis internas
* **Parâmetros Formais:** identificadores nas abstrações que denotam argumentos
    * `pot(float x, int n)`
* **Parâmetros Atuais:** expressão associada a cada parâmetro formal no uso da abstração
    * `pot(10.0, 2)`
* **Argumentos:** valores dos parâmetros atuais

### 7.3.1 - Mecanismos de Passagem de Parâmetros
* Determinam como os parâmetros atuais são associados aos parâmetros formais da abstração
* **Mecanismos:** de cópia e de referência a valores
* **Mecanismo de Cópia de Valores (7.3.1.1):** parâmetros da abstração criados como variáveis locais
    * Argumentos são copiados para tais parâmetros no momento da aplicação, logo, não há associação entre os parâmetros formais e atuais da abstração
    * Os parâmetros atuais do programa não sofrem mudanças efetuadas sobre os parâmetros formais da abstração
* **Mecanismo de Referência a Valores (7.3.1.2):** parâmetro formal é vinculado diretamente ao parâmetro atual, compartilhando a vinculação de memória e conteúdo
    * Todas modificações sobre o parâmetro formal da abstração corresponde a modificar o parâmetro atual do programa
    * Pascal usa a palavra `var` para indicar passagem por referência
    * Em C, deve-se utilizar apontadores para passagem de parâmetro por referência

### 7.3.2 - Parametrização de Tipos
* Abstrações fornecem reutilização de código, que melhora a produtividade
* Algoritmos com tipos genéricos (parametrização de tipos) proporciona polimorfismo das abstrações

### 7.3.3 - Ordem de Avaliação
* Ordem de avaliação de uma expressão influencia o resultado quando efeitos colaterais são permitidos
* A ordem de avaliação dos parâmetros das abstrações também pode afetar os resultados
* **Formas de ordem de avaliação de parâmetros:** avaliação **sob demanda** e **a priori**
<br><br>
* **Avaliação a priori:** todos argumentos são avaliados completamente para iniciar o processamento da abstração
* **Avaliação sob demanda:** processamento se inicia quando a abstração é aplicada e os argumentos são avaliados conforme são usados
* **Exemplo:**
    ```SML
    fun escolha (b1: bool, x:int, y:int) =
        if b1 then x else y;
    val a = 0;
    val b = 10;
    escolha (b>50, b/a, a/b);
    ```
    * Com avaliação a priori, ocorrerá um erro em b/a (divisão por zero)
    * Com avaliação sob demanda, a divisão por zero em b/a não ocorrerá no processamento