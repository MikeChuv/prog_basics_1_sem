program lab14_v30;

type 
    func = function(const x:real):real;

function bis(x:real):real;
begin
    bis := sqrt( 1.96 - (power(x,3)/9) + 1/x ) - x;
end;

function bis1(x:real):real;
begin
    bis1 := (power(4,1/3) - power(sin(x/10),2))/(sqrt(x)) -x;
end;



function rootBis(a,b,e:real; f:func):real;
var m:real;
begin
    while (abs(a-b)>e) and (bis(a)>e) do begin
        m := (a + b) / 2;
        if f(a) * f(m) < 0 then b := m
        else a := m;
    end;
    result := (a + b) / 2
end;

function rootIter(a,b,e:real; f:func):real;
var x1,x0:real;
begin
    x1 := (a + b) / 2;
    repeat 
        x0 := x1;
        x1 := f(x0) + x0;  
    until abs(x0-x1)<e;
    result := x1;
end;




var e,a,b,x:real;
	e0:string;

begin
    a := 0;
    b := 3;

    writeln('Введите точность');
    readln(e0);
    real.TryParse(e0,e);

    writeln('Решение методом бисекций = ',rootBis(a,b,e,bis));
    writeln(e);

    x := rootIter(a,b,e,bis);
    writeln('Решение методом итераций = ',x);
    writeln('Значение функции в точке x1 = ', bis(x));
    writeln;
    writeln('#################===================#############');
    writeln;
    writeln('Решение методом бисекций = ',rootBis(a,b,e,bis1));
    writeln(e);

    x := rootIter(a,b,e,bis1);
    writeln('Решение методом итераций = ',x);
    writeln('Значение функции в точке x1 = ', bis1(x));
end.
