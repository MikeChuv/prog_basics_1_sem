program lab5_var30;
const nmax = 100;
type mas = array[1..nmax] of real;

var x,y,z: mas;
	n,i:byte;
	tmp: real;
	
	
procedure vvod(var x:mas; n:byte);
var i:byte;
begin
	for i:=1 to n do begin
		writeln('Введите эдемент массива [',i,']');
		readln(x[i]);
	end;
end;


procedure vivod(var x:mas; n:byte);
var i:byte;
begin
	for i:=1 to n do 
		write(x[i]:4:2,' ');
	writeln;
end;



begin
	write('Введите количество элементов в массиве');
	readln(n);
	if (n > nmax) or (n <= 0) then writeln('Неверно заданы исходные данные')
	else
	begin
		writeln('Ввод массива x');
		vvod(x,n);
		writeln('Ввод массива y');
		vvod(y,n);
		writeln('Ввод массива z');
		vvod(z,n);
		writeln('Вывод исходных массивов');
		vivod(x,n);
		vivod(y,n);
		vivod(z,n);
		for i:= 1 to n do begin
			if x[i] > y[i] then begin 
				tmp := x[i];
				x[i] := y[i];
				y[i] := tmp;
			end;
			if y[i] > z[i] then begin 
				tmp := y[i];
				y[i] := z[i];
				z[i] := tmp;
			end;
			if x[i] > y[i] then begin 
				tmp := x[i];
				x[i] := y[i];
				y[i] := tmp;
			end;
		end;
		writeln('Вывод массивов');
		vivod(x,n);
		vivod(y,n);
		vivod(z,n);
	end;
end.
