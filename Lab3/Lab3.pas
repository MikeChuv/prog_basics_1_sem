program task2_var30;
var x, e: real; 
    s, y: real;
    n, i, j, cnti, cntj: longint;
    a, k: real;   
begin
	writeln('Введите значение x');
	Readln(x);
	writeln('Введите точность');
	Readln(e); 
	if (x <= 0) or (x > 1)  or (e <= 0) then writeln('Неверно заданы исходные данные')
	else 
	begin
		a := x * 0.5;
		s := a;
		i := 2;
		j := 24;
		k := x;
		cnti := 2;
		cntj := 4;
		while abs(a)>e do
		begin
			k := k * (-x);
			a := k * ((1/i) - (1/j));
			s := s + a;
			i := i * (cnti+1);
			j := j * (cntj+1) * (cntj+2);
			cnti := cnti + 1;
			cntj := cntj + 2;
		end;
		y := cos(sqrt(x)) - exp(-x);    
		writeln('Значение суммы ряда =            ', s);
		writeln('Значение по кнтрольной формуле = ', y);
	end;
end.
