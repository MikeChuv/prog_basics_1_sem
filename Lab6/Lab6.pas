program lab6_var30;
const nmax = 100;
type mas=array[1..nmax] of real;

var x:mas;
	i,n,maxi:byte;
	max:real;
	f:textfile;
	
	

begin
	if paramcount < 2 then writeln('Недостаточно параметров')
	else begin
		if not fileexists(paramstr(1)) then writeln('Невозможно открыть файл для чтения')
		else begin
			assignfile(f,paramstr(1));
			reset(f);
			readln(f,n);
			
			if (n > nmax) or (n <= 0) then writeln('Неверно заданы исходные данные')
			else
			begin
				for i:=1 to n do 
					read(f,x[i]);
				closefile(f);
				
				if n = 1 then writeln('Недостаточно данных в файле')
				else
				begin
					max := abs(x[2])-abs(x[1]);
					maxi := 2;
					for i:=3 to n do 
						begin
							if (abs(x[i])-abs(x[i-1])) > max then 
							begin
								max := abs(x[i])-abs(x[i-1]);
								maxi := i;
							end;
						end;
				
				
				AssignFile(f, paramstr(2));
				Rewrite(f);
				writeln(f, 'Array X of ', n:2, ' elements');
				for i := 1 to n do 
					write(f, x[i]:8:2, ' ');
				writeln(f); writeln(f);
				writeln(f, 'Max difference = ', max:2);
				writeln(f, 'Index = ', maxi:2);
				CloseFile(f);
				end;
			end;
		end;
	end;
end.
