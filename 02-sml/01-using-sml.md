# Usando o Sistema SML/NJ
* [Informação do Link](http://www.cs.cmu.edu/afs/cs/local/sml/common/smlguide/smlnj.htm#basis)

### Loop de Execução do Interpretador
* Definindo <code>fun inc x = x + 1;</code>
    * Retorna <code>val inc = fn : int -> int</code>
* Depois, <code>fun f n = (inc n) * 5;</code>
    * Retorna <code>val f = fn : int -> int</code>
* Temos que <code>f (2 + 4);</code>
    * Retorna <code>val it = 35 : int</code>
* Redefinindo uma função em SML, não altera o identificador vinculado a ela, ou seja, redefinindo <code>fun inc x = x + 2;</code>,
<code>f (2 + 4);</code> ainda retornaria 35
* Isso evita conflitos de tipos na utilização de uma função que dependa da outra modificada
* Em SML, tal redefinição no loop correspondera à seguinte declaração aninhada:
    ```SML
    let fun inc x = x + 1 in
        let fun f n = (inc n) * 5 in
         let fun inc x = x + 2 in
            ...
    ```
### Usando Programas em Arquivos
* <code>use "program.sml"</code>
* **Compilando Múltiplos Arquivos**
    * Compilation Manager (CM)
    * <code>sml-cm</code>
    * Criação de um arquivo <code>sources.cm</code> contendo
        ```SML
        Group is

        a.sig
        b.sml
        c.sml
        ```
    * Usa-se a função <code>CM.make();</code> no interpretador SML/NJ para compilar
### Standard Basis (Bibliotecas)
* **Mudando de diretório no Interpretador:**
    * <code>OS.FileSys.chDir : string -> unit</code>
* **Controlling Output:**
    * <code>Compiler.Control.Print.printDepth : int ref</code>
    * <code>Compiler.Control.Print.printLength : int ref</code>
    * Usadas através de atribuição:
        * <code>Compiler.Control.Print.printDepth := 10;</code>