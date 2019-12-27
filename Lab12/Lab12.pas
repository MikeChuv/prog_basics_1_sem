//Даны три одномерных массива a, b и c разного размера. 
//Какой из массивов имеет максимальную сумму элементов, квадрат величины которых больше заданного числа?  
program lab12_v30;

const
nmax = 20;

type
mas = array[1..nmax] of real;


var	
	// Входные данные
	a,b,c: mas; 
	// Промежуточные данные
	i,j,an, bn, cn: integer;
    max,k,sa,sb,sc: real;
    arrayname : char;
	f:textfile;
	

procedure vvod(var x:mas;var n:integer; var f:textfile );
var i: integer;
begin
    readln(f, n);
    if n > nmax then writeln('NZID')
    else begin
        for i := 1 to n-1 do 
            read(f,x[i]);
        readln(f,x[n]);
    end;
end;

procedure print(const x:mas; n:integer);
var i: integer;
begin
    for i := 1 to n do
        write(x[i], ' '); 
    writeln;
end;

function sumgreater(const x:mas; n: integer; k: real):real;
var i: integer;
    sum: real;
begin
    sum := 0;
    for i := 1 to n do begin
        if power(x[i],2) > k then sum := sum + x[i]; 
    end;
    sumgreater := sum;
end;


procedure writevector(const y:mas; m:integer;var f:textfile);
var i: integer;
begin
    for i:=1 to m do begin
        write(f, y[i],' ');
    end;
    writeln(f);
end;


begin
if ParamCount < 2 then	              { Проверяем количество параметров }
	writeln('Недостаточно параметров!')
	else
	begin
 		if not FileExists(ParamStr(1)) then	      { Проверяем существование файла }
      		writeln('Невозможно открыть файл ''', ParamStr(1), ''' для чтения')
		else
		begin
        AssignFile(f, ParamStr(1));	       { Открываем файл }
        Reset(f);
        readln(f,k);
        vvod(a,an,f);
        vvod(b,bn,f);
        vvod(c,cn,f);
        CloseFile(f);   { Закрываем файл }

  		print(a, an);
        print(b, bn);
        print(c, cn);

        AssignFile(f, ParamStr(2));
        rewrite(f);
// =============== Нахождение максимального из трех ============
        sa := sumgreater(a,an,k);
        sb := sumgreater(b,bn,k);
        sc := sumgreater(c,cn,k);
        max := sa;
        arrayname := 'A';
        if sb > max then begin
            max := sb;
            arrayname := 'B';
            end; 
        if sc > max then begin 
            max := sc;
            arrayname := 'C';
            end;
// =============== Вывод  нужного массива ==========
        if arrayname = 'A' then begin 
            print(a,an);
            writeln(f,'In Array A:',max);
            writevector(a,an,f);
            end;
        if arrayname = 'B' then begin 
            print(b,bn);
            writeln(f,'In Array B:',max);
            writevector(b,bn,f);
            end;
        if arrayname = 'C' then begin 
            print(c,cn);    
            writeln(f,'In Array C:',max);
            writevector(c,cn,f);
            end;
        

        CloseFile(f);
        end;
    end;
end.