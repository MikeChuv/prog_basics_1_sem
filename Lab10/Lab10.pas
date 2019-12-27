// Проверить, все ли столбцы матрицы упорядочены по возрастанию. Если не все, найти номер первого неупорядоченного столбца. 
program lab8_v30;

const
nmax = 20;

type
mas = array[1..nmax, 1..nmax] of real;
var	
	// Входные данные
	a: mas; 
	n,m: integer;
	// Промежуточные данные
	i,j, myj: integer;
	f:textfile;
	greater: boolean;
begin
if ParamCount < 2 then	              { Проверяем количество параметров }
	writeln('Недостаточно параметров!')
	else
	begin
 		if not FileExists(ParamStr(1)) then	      { Проверяем существование файла }
      		writeln('Невозможно открыть файл ''', ParamStr(1), ''' для чтения')
		else
		begin

{ #########-----Ввод исходных данных------################ }
  		AssignFile(f, ParamStr(1));	       { Открываем файл }
  		Reset(f);
  		readln(f, n);
		readln(f, m);
  		for i := 1 to n do begin
			for j := 1 to m-1 do
				read(f, a[i,j]);
			readln(f, a[i, m]);
		end;
		CloseFile(f);   { Закрываем файл }
        greater := true;
        j := 1; 
        while greater and (j <= m) do begin
            i := 1;
            while greater and (i <= n-1) do begin
                if a[i,j] > a[i+1,j] then greater := false;
                i := i + 1;
            end;
            j := j + 1;
        end;
        myj := j;
        AssignFile(f, paramstr(2));
		Rewrite(f);
		writeln(f,'Array A:');
		for i := 1 to n do begin
			for j := 1 to m-1 do
				write(f, a[i,j]:6:2);
			writeln(f, a[i, m]:6:2);
		end;
		writeln(f); writeln(f);
        if greater then writeln(f,'All cols are arranged')
        else writeln(f, 'number of first unarranged col: ',myj-1);
        CloseFile(f);
        end;
    end;
end.