program lab8_v30;

const
nmax = 20;

type
mas = array[1..nmax] of integer;
var	
	// Входные данные
	a: mas; 
	n,t,b: integer;
	// Промежуточные данные
	imin, i, ni: integer;
	tExists, nFlag, fl: boolean;
	fi,fo:textfile;
	// Выходные данные
	min: integer;
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
  		AssignFile(fi, ParamStr(1));	       { Открываем файл }
  		Reset(fi);
  		readln(fi, n);
  		for i := 1 to n do
    		read(fi, a[i]);
  		readln(fi, t);
	    readln(fi, b);
  		CloseFile(fi); 	                       { Закрываем файл }
			ni := 0;

			{ Ищем последний, меньший t}
			for i:=1 to n do						
				if a[i] < t then ni := i;

			{ Если нет элементов меньших t}
			if ni = 0 then begin
				tExists := false;
				nFlag := true;
			end
			
			else begin
				tExists := true;
				nFlag := false;
			end;

			{проверяем, существуют ли элементы, меньше b}
			i := 1;
			fl := true;
			while fl and (i<=n) do begin
				if a[i]>b then fl := false;
				i := i+1;
			end;

			{Ищем минимальный}
			if not fl then begin
				min := a[i-1];
				i := 1;
				while (tExists and (i<=ni)) or (nFlag and (i<=n)) do begin
						if a[i]>b then
							if a[i] < min then min := a[i];
						i := i + 1;
				end;
			end;
			
			
			AssignFile(fo, paramstr(2));
			Rewrite(fo);
			writeln(fo,'Array A of ', n:2, ' elements');
			for i := 1 to n do
				write(fo, a[i], ' ');
			writeln(fo); writeln(fo);
			writeln(fo,'Value t = ',t);
			writeln(fo);
			
			if nFlag then writeln(fo,'No elements, smaller than ', t, 'searching to end');
			if fl then writeln(fo,'All elements <= than ', b)
			else begin 
				writeln(fo,'Last element, greater than ', b, ' = ', a[ni]);
				writeln(fo,'Min = ', min);
			end;
			closefile(fo);
	end;
end;

end.
