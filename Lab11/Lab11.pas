//Даны три одномерных массива a, b и c разного размера. 
//Для каждого из этих массивов сформировать массив, содержащий номера элементов исходного массива, 
//которые меньше половины среднего арифметического значений исходного массива. 
//Для формирования массива из номеров элементов, меньших половины среднего арифметического, использовать процедуру. 
//Для ввода и вывода массивов также использовать процедуры. 
program lab11_v30;

const
nmax = 20;

type
mas = array[1..nmax] of real;


var	
	// Входные данные
	a,b,c,ay,by,cy: mas; 
	// Промежуточные данные
	i,j,an, bn, cn,ayn,byn,cyn: integer;
    sa, sb, sc: real;
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

procedure print(var x:mas; n:integer);
var i: integer;
begin
    for i := 1 to n do
        write(x[i]); 
    writeln;
end;

function srarifm(var x:mas; n:integer):real;
var s: real;
    i: integer;
begin
    s := 0;
    for i:=1 to n do begin
        s := s + x[i];
    end;
    srarifm := s / n;
end;

procedure createvector(var x,y:mas; var s:real;var n,m:integer);
var i: integer;
begin
    m := 1;
    for i:=1 to n do begin
        if x[i] < (s/2) then begin
            y[m] := i;
            m := m + 1;
            end;
    end;
    m := m - 1;
end;


procedure writevector(var y:mas; m:integer;var f:textfile);
var i: integer;
begin
    for i:=1 to m do begin
        write(f, y[i], ' ');
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
        vvod(a,an,f);
        vvod(b,bn,f);
        vvod(c,cn,f);
        CloseFile(f);   { Закрываем файл }

  		print(a, an);
        print(b, bn);
        print(c, cn);

        sa := srarifm(a,an);
        sb := srarifm(b,bn);
        sc := srarifm(c,cn);

        createvector(a,ay,sa,an,ayn);
        createvector(b,by,sb,bn,byn);
        createvector(c,cy,sc,cn,cyn);

        AssignFile(f, ParamStr(2));
        rewrite(f);

        writeln(f,'Array A:');
        writevector(a,an,f);
        writeln(f,'Arithmetic mean: ',sa);
        writeln(f,'Indexes of numbers less than s/2:');
        writevector(ay,ayn,f);
        writeln(f);

        writeln(f,'Array B:');
        writevector(b,bn,f);
        writeln(f,'Arithmetic mean: ',sb);
        writeln(f,'Indexes of numbers less than s/2:');
        writevector(by,byn,f);
        writeln(f);

        writeln(f,'Array C:');
        writevector(c,cn,f);
        writeln(f,'Arithmetic mean: ',sc);
        writeln(f,'Indexes of numbers less than s/2:');
        writevector(cy,cyn,f);
        CloseFile(f);
        end;
    end;
end.