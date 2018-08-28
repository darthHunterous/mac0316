
# 4.3 - Existência de Variáveis

* Além de classificar variáveis de acordo com o **acesso** e **armazenamento** (variáveis simples e composta), ainda é necessário classificá-las de acordo com a existência ao longo da execução do programa
* **Tempo de vida da variável**
    * Desde a **alocação** até a **desalocação**
        * **Alocação**
            * Quando a variável é vinculada a uma célula memória
        * **Desalocação**
            * Quando o espaço da célular é disponibilizado novamente
    * **Variáveis Globais e Locais**
        * Alocadas antes do início da execução
    * **Variáveis Heap**
        * Criadas em tempo de execução
    * **Variáveis Persistentes**
        * Existentes mesmo após a execução do programa
<br><br>
### 4.3.1 - Variáveis Globais e Locais
* **Globais**: vinculadas às células de memória antes da execução do programa, permanecendo até o final da execução
* **Locais**: tempo de vida relacionado ao bloco de execução na qual estão inseridas
    * Tais blocos podem ser ativados váris vezes durante a execução, porém os valores de tal variável são novos a cada ativação, pois os valores de variáveis locais não são retidos após o término da ativação do bloco
    * Variáveis declaradas como <code>static</code> tem seus valores retidos, tornando-as globais
<br><br>
### 4.3.2. - Variáveis Intermitentes - Heap
* Criadas em tempo de execução
* Apontadores como exemplo
* Células de memória são associadas mediante comando de criação de variável (alocação)
* Destruição é feita via comando de desalocação ou coleta de lixo
* Diferem das variáveis locais através do controle explícito de sua existência pelos comandos de criação e destruicão, enquanto que variáveis locais tem existência relacionada aos blocos de execução
* Variáveis globais, locais e heap tem existência limitada ao tempo de execução do programa
<br><br>
### 4.3.3 - Variáveis Persistentes
* Para reutilização de dados, utiliza-se arquivos ou banco de dados para armazenamento mesmo quando o programa não está em execução
* Necessita-se utilizar uma variável do tipo arquivo
<br><br>
### 4.3.4 - Problemas na Existência de Variáveis
* Exemplo de referência a uma variável local podem levar à tentativa de acessar uma variável não mais existente
* Pascal evita tal problema não permitindo referência a uma variável local
* Referências a variáveis locais devem ser passadas como parâmetro 
