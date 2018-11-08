## 7.4 - Abstração de Tipos
* Módulos: conjuntos de abstrações de dados processos
    * Unidades de programas e de compilação
* **Encapsulamento:** módulo encapsula todas definições que nele existem
* **Ocultação de Informação:** diferenciar abstrações que devem ser usadas apenas como auxílio ao funcionamento de outras (uso interno do módulo, não devendo ser conhecidas pelo usuário), de abstrações de uso externo
* Portanto, o módulo deve agrupar abstrações e distinguir dentre informações visíveis e não visíveis externamente
* Modularização em Modula-2 e Ada
    * Módulos (pacotes) divididos em **interface** e **corpo**
    * **Interface:** apenas cabeçalhos das abstrações de uso externo
    * **Corpo:** implementação de todas abstrações
    * Usuário deve acessar apenas a interface do módulo, ocultando-se o corpo
* Modularização e ocultação de informação favorecem que a definição das interfaces de uso, diferenciando informações externas e internas
* Modularização e formas de ocultação de informação permitem a definição de **tipos abstratos**

### 7.4.1 - Tipos Abstratos