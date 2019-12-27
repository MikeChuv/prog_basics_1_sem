program lab4;
var e,a,b,m,x1,x0:real;
	e0:string;
function bis(x:real):real;
begin
  bis := sqrt( 1.96 - (power(x,3)/9) + 1/x ) - x;
end;

function iter(x:real):real;
begin
  iter := sqrt( 1.96 - (power(x,3)/9) + 1/x )
end;


begin
  a := 0;
  b := 3;
  
  writeln('Введите точность');
  readln(e0);
  real.TryParse(e0,e);
  while (abs(a-b)>e) and (bis(a)>e) do 
  begin
    m := (a+b)/2;
    if bis(a) * bis(m)<0 then b := m
    else a := m;
  end;
  writeln('Решение методом бисекций = ',a);
  writeln(e);
  
  x1 := (0 + 3) / 2;
  repeat 
    x0 := x1;
    x1 := iter(x0);  
  until abs(x0-x1)<e;
  writeln('Решение методом итераций = ',x1);
  writeln('Значение функции в точне x1 = ', bis(x1));
end.
