program buscaPGM;
const
    MAX	   = 1000;
    PRETO  = 0;
type
    TpMatriz = array[1..MAX, 1..MAX] of integer;
var
    arqIm, arqP, arqSai		        :text;
    nomeArqIm, nomeArqP, nomeArqSai :string[30];
    im, imP			                :TpMatriz;
    numLin, numCol, numMax	        :integer;
    linP, colP, maxP		        :integer;
    i, j				            :integer;

procedure leArqPGM(var f : text; 
        var m: TpMatriz; var numLin, numCol, numMax: integer);
var
    id	    :string;
    i, j	:integer;
begin
    readln( f, id );
    readln( f, numCol, numLin );
    readln( f, numMax );
    for i:=1 to numLin do
        for j:= 1 to numCol do
            read( f, m[i,j] );
end; { leArqPGM }

procedure escreveArqPGM(var f : text; 
        var m: TpMatriz; numLin, numCol, numMax: integer);
var
    i, j: integer;
begin
    writeln( f, 'P2' );
    writeln( f, numCol:4, numLin:4 );
    writeln( f, numMax );
    for i:= 1 to numLin do
    begin
        for j:= 1 to numCol do
            write(f, m[i,j]:4);
        writeln( f );
    end;
end; { escreveArqPGM }

    (*  Funcao achouPadrao:
    *  retorna true se o padrao de imagem imP com tamanho linP s colP
    *  for encontrado na imagem im com o canto superior esquerdo na posicao
    *  (linIni, colIni) *)

function achouPadrao(var im  : TpMatriz; linIni, colIni: integer; 
        var imP : TpMatriz; linP, colP: integer): boolean;
var 
    x, y, a, b: integer; (*x e y controlam a matriz, enquanto a e b controlam o padrao*)
    padrozinado: boolean; 
begin
    x:= linIni;
    y:= colIni;
    a:= 1;
    padrozinado:= true;
    while ((x < (linIni+linP-1)) and padrozinado) do
    begin
        y:= colIni;
        b:= 1;
        while (y < (colIni+colP-1)) do
        begin
            if (im[x, y] <> imP[a, b]) then
            begin
                padrozinado:= false;
                break;
            end;
            b:= b + 1;
            y:= y + 1;
        end;
        x:= x + 1;
        a:= a + 1;
    end;
    achouPadrao:= padrozinado; 
end; { achouPadrao }


    (* Procedimento bordaPreta:
    * altera a imagem im, colocando uma borda de cor PRETO de tamanho
    * numLin x numCol com o canto superior esquerdo na posicao (linIni, colIni) *)

procedure bordaPreta (var im : TpMatriz; linIni, colIni, numLin, numCol: integer);
var 
    x, y: integer;
begin
    for x:=linIni to linIni+numLin-1 do
        for y:=colIni to colIni+numCol-1 do
            if ((x = linIni) or (x = linIni+numLin-1) or 
                (y = colIni) or (y = colIni+numCol-1)) then
                im[x, y]:= 0;

end; { bordaPreta }

begin
    writeln('Arquivo imagem PGM: ');  
    readln( nomeArqIm );
    assign( arqIm, nomeArqIm );
    reset( arqIm );
    leArqPGM( arqIm, im, numLin, numCol, numMax );
    close( arqIm );
    
    writeln('Arquivo padrao PGM: ');
    readln( nomeArqP );
    assign( arqP, nomeArqP );
    reset( arqP );
    leArqPGM( arqP, imP, linP, colP, maxP );
    close( arqP );
    
    for i:=1 to numLin-linP+1 do
        for j:=1 to numCol-colP+1 do
            if achouPadrao(im, i, j, imP, linP, colP) then
                bordaPreta(im, i, j, linP, colP);

    writeln('Arquivo saida PGM: ');
    readln( nomeArqSai );
    assign( arqSai, nomeArqSai );
    rewrite( arqSai );
    escreveArqPGM( arqSai, im, numLin, numCol, numMax );
    close( arqSai );
end.
