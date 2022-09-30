# reconhece-padroes

###### este projeto busca um tipo de padrão descrito em uma imagem .pgm em outra imagem .pgm

para rodar o programa, você deve ter instalado
algum compilador pascal em seu computador.
É recomendado o "free pascal", e para instalá-lo,
em sistemas baseados no debian, é algo simples:

> 1. abra um terminal (Ctrl + Alt + T);
> 2. digite "sudo apt install fpc";

para compilar o programa você precisará rodar o
seguinte comando:

```bash    
    fpc "nome-do-seu-programa.pas"
    fpc buscaPGM.pas
```
para rodar o programa utilize:
```
    ./verifica-solucao-sodoku
```
_____________________________________________________________________________________

após iniciar o programa, você deve entrar com os seguintes arquivos .pgm:

> 1. nome da imagem em que o padrão deve ser buscado;
> 2. nome da imagem que contém o padrão;
> 3. nome da imagem onde o padrão será mostrado;

exemplo de uso dos arquivos com os arquivos inseridos no projeto:
> 1. circulos.pgm
> 2. padrao.pgm
> 3. resultado.pgm
