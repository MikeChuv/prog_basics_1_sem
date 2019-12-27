program lab9_v30;
// Все положительные элементы матрицы заменить значением элемента, стоящего последним в том же столбце. 
const
nmax = 20;

type
mas = array[1..nmax, 1..nmax] of real;
var	
	// Входные данные
	a: mas; // он же выходной
	n,m: integer;
	// Промежуточные данные
	i,j: integer;
	swapper: real;
	f:textfile;
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

{ #########-----Обработка и вывод--------################## }		
		AssignFile(f, paramstr(2));
		Rewrite(f);
		writeln(f,'Array A (before):');
		for i := 1 to n do begin
			for j := 1 to m-1 do
				write(f, a[i,j]:6:2);
			writeln(f, a[i, m]:6:2);
		end;
		writeln(f); writeln(f);

		for i:=1 to n do begin
			swapper := a[i,m];
			for j:=1 to m-1 do begin
				if a[i,j] > 0 then a[i,j] := swapper;
			end;
		end;
		writeln(f,'Array A (after):');
		for i := 1 to n do begin
			for j := 1 to m-1 do
				write(f, a[i,j]:6:2);
			writeln(f, a[i, m]:6:2);
		end;
		writeln(f); writeln(f);
		CloseFile(f);
		end;
	end;
end.