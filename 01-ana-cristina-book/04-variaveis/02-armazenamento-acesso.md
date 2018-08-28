# 4.2 - Armazenamento e Acesso a Valores

* **Variáveis Simples**
    * Armazenamento e acesso só pode ser realizado sobre o valor como um todo
* **Variáveis Compostas**
    * Podem ser desmembradas em elementos mais simples
<br><br>
## 4.2.1 - Variáveis Simples
* Denotam espaços com conteúdos armazenados e acessados atomicamente
    * Tipos primitivos são armazenados e modificados como um todo
        * Não há como armazenar apenas parte dos valores
<br><br>
* **4.2.1.1 - Tipos Primitivos**
    * Sempre referidos como elementos atômicos mesmo que seus elementos possam ser desmembrados
        * Exemplo
            * Número inteiro é representado pelo seu sinal e valor, porém não o desmembramos em seu tratamento
            * Números reais são representados por um expoente e uma parte fracionária, não sendo desmembrados nas linguagens de programação
        * Em ambos os casos, o armazenamento ocorre de forma atômica
    * Valores caracteres e booleanos são armazenados em variáveis simples
        * Valores booleanos não são predefinidos em C, podendo ser obtidos através de enumeração, sendo tratado em variáveis simples, como qualquer outro tipo enumerado
        ```C
        enum Bool {false, true};
        ...
        Bool b;
        ...
        b = true;
        ...
        if (b == true) {
            ...
        }
        ```
        * O primeiro elemento da enumeração corresponde a zero e o segundo a um
        * Um valor enumerado é armazendo em uma variável simples do mesmo tipo da enumeração
            * O acesso é direto ao valor correspondente, como em qualquer variável simples
    * Em Pascal, tipos enumerados também são armazenados em variáveis simples
        * Enumeração explícita dos valores
        * Definição de um novo tipo como subintervalo de um tipo já existente
    * **Apontadores**
        * Tipos primitivos
        * Seus valores são endereços de memória onde se encontram outros valores, os desejados
        * Portanto armazenam um único valor, sendo variável simples
        * **Apontadores em Pascal**
        ```Pascal
        var int_ptr1, int_ptr2 : ^ Integer; {apontadores para inteiros}
            i : Integer;
        ...
        New(int_ptr1); {cria espaço para armazenar um inteiro apontado por int_ptr1}
        i:= 10;
        int_ptr2 := @i; {armazena no apontador o endereço da variável i}
        ...
        int_ptr1^ := i; {armazena o valor de i no espaço para qual int_ptr1 aponta}
        ...
        Dispose(int_ptr1); {libera o espaço usado para armazenar o inteiro apontado por int_ptr1}
        ...
        ```
        * **Apontadores em C**
        ```C
        int *int_ptr1, *int_ptr2; /* apontadores para inteiros */
        int i;
        ...
        int_ptr1 = (int *) malloc(sizeof(int)); /* cria espaço para armazena um inteiro apontado por int_ptr1 */
        i = 10;
        int_ptr2 = &i; /* recebe o endereço da variável i */
        ...
        *int_ptr1 = i; /* armazena o valor de i no espaço apontado por int_ptr1 */
        ...
        free (int_ptr1); /* libera o espaço reservado para armazenar o inteiro apontado por int_ptr1 */
        ...
        ```
        * Apontadores em C são flexíveis
        * Operações aritméticas podem ser realizadas sobre apontadores
        * Acesso direto à memória
    * Em Pascal, apontadores são usados para acessar variáveis anônimas alocadas dinamicamente
    * Reserva dinâmica de espaço de memória introduz a ideia de administração dos espaços de memória pelos programadores
    * Mecanismos para liberação automática de espaços de variáveis alocadas dinamicamente requer grande custo de processamento
        * Coleta de espaços de memória não utilizados relaciona-se à implementação de processadores de linguagens
    * Embora com apontadores seja possível acessar o endereço de memória e o conteúdo associado, não se trata de uma variável estruturada (composta), pois o valor tratado por um apontador é apenas o conteúdo associado ao endereço de memória
<br><br>
* **4.2.1.2 - Tipos Compostos**
    * Maioria dos tipos compostos tem valores tratados de maneira seletiva e portanto armazenados em variáveis compostas
    * Conjuntos implementados em Pascal e Modula-3 são tratados como elemento único, sem acesso direto a componentes, como i-ésimo componente
        * Variáveis de tal tipo conjunto só podem ser manipuladas por operações predefinidas sobre conjuntos
        * Embora sejam tipo composto, acesso e armazenamento ocorre de forma não seletiva, portanto usa-se variáveis simples
        * Limitações na implementação
            * Semelhantes à enumeração, conjuntos não podem ser entrada ou saída de funções em Pascal ou Modula-3
            * Há limite para o tamanho máximo de elementos nos conjuntos (cerca de 100 elementos)
                * Comumente implementados sobre strings de bits que cabem em uma única palavra de máquina por conta de eficiência
<br><br>
* **4.2.1.3 - Tipos Recursivos**
    * Listas são o tipo recursivo mais comum
    * Representadas por variáveis que armazenam um valor e um apontador para o próximo elemento
    * Algumas linguagens possuem listas como tipo predefinido
        * Geralmente linguagens funcionais, sem acesso e armazenamento seletivo dos elementos
        * Listas como elemento único, sem acesso ao i-ésimo elemento sem efetuar operações sucessivas
    * **Construção de Listas em SML**
        * 5::3::2::nil = 5::3::[2] = 5::[3,2] = [5, 3, 2]
    * Variáveis não são comumente usadas em definiçõoes de linguagens funcionais, pois são orientadas a expressões em vez de comandos. Porém, variáveis simplificam a aplicação de operações
<br><br>
## 4.2.2 - Variáveis Compostas
* Componentes que podem ser tratados seletivamente
<br><br>
* **4.2.2.1 - Produto Cartesiano**
    * Registros em Pascal (**record**)
    * Estruturas em C (**struct**)
    * **Exemplo**
        * Estruturas em C
        * Uma estrutura do typo var_struct pode ter seu subelemento field acessado seletivamente por <code>var_struct.field</code>
        * Portanto trata-se de variável composta
<br><br>
* **4.2.2.2 - União Disjunta**
    * Na união disjunta, mais de uma variável compartilha o mesmo espaço de memória, sendo apenas uma acessível
    * Tal acesso se dá de maneira seletiva, caracterizando a variável como composta
    * **Exemplo - C**
    ```C
    union NumeroC {
        int ival;
        float rval;
    };
    ...
    union NumeroC valor;
    ...
    valor.ival = 5;
    valor.ival = valor.ival + 10;
    ...
    valor.rval = 5.87;
    valor.rval = valor.rval + 20.0;
    ...
    ```
    * Quando se atribui um valor a valor.ival, valor.rval não possui valor
    * Quando se atribui um valor a valor.rval, o valor em valor.ival é perdido
    * **Exemplo Pascal - União Disjunta Discriminada**
    ```Pascal
    type Precisao = {exato, aprox};
        NumeroP = record
                  case prec : Precisao of
                      exato : (ival : Integer);
                      aprox : (rval : Real);
                  end;
    var num : NumeroP;
        i   : Integer;
        r   : Real;
    ...
    case num.prec of
        exato: i := num.ival;
        aprox: r := num.rval;
    end
    ```
    * num.prec tem apenas um dos valores de Precisao e, de acordo com tal valor, apenas num.ival ou num.rval pode ser acessada
    * Assim como em C, união disjunta em Pascal requer variável composta para ser representada
<br><br>
* **4.2.2.3 - Mapeamentos**
    * Arrays, acesso aos elementos do domínio (índices) e elementos imagem
    * Temos acesso aos valores imagens apenas mediante índices
    * **Exemplo - Mapeamento em C**
        * Quando um array é declarado com 16 elementos, índices variam de zero a quinze, sendo inteiros
        * Armazenamento e acesso dos elementos imagem é realizado diretamente com o uso do índice
    * **Exemplo - Mapeamento em Pascal**
        * Índices precisam ser definidos explicitamente em Pascal, sem obrigatoriedade de serem inteiros
    * **Arrays multidimensionais**
        * Fortran limtiado a três índices por eficiência
        * C admite apenas um índice, mas cada elemento de um array pode ser um array em si, resultando em arrays multidimensionais
    * Arrays em C podem ser tanto armazenados de maneira seletiva quanto de forma integral
        * Armazenar todos os elementos de um array de uma vez
            * int n[5] = {32, 45, 66, 23, 58};
        * Não descaracteriza o array como variável composta, pois seus subcomponentes podem ser armazenados ou acessados de maneira seletiva
<br><br>
* **4.2.2.4 - Tipos Recursivos**
    * Tipicamente listas
    * Geralmente criadas pelos usuários como uma nova estrutura de dados
        * Tratamento seletivo, como em qualquer estrutura criada pelo usuário
    * Porém listas de linguagens funcionais são tratadas como único elemento
    * Tipos recursivos são definidos através de um novo tipo em que um dos subelementos são declarados como pertencentes ao próprio tipo
        * Listas podem ter tipo definido por apontadores para uma lista de mesmo tipo  