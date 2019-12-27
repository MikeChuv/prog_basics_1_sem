unit computing;

interface 
uses mytypes,myio;

function func1(x:real):real;
function func2(x:real):real;
function sumIndex(const x:mas; n,m:integer;f:func):integer;
procedure reverse(var x:mas;n,m:integer;rowIndex:integer);



implementation

function func1:real;
begin
    func1 := x;
end;


function func2:real;
begin
    func2 := power(x,2)-2*x;
end;

function sumIndex:integer;
var i,j,maxi:integer;
    max,sum: real;
begin
    max := 0;
    maxi := 0;
    for i := 1 to n do begin
        sum := 0;
        for j := 1 to m do begin
            if f(x[i,j]) > 0 then sum := sum + x[i,j];
        end;
        if sum > max then begin
            maxi := i;
            max := sum;
        end;
    end;
    sumIndex := maxi;
end;

procedure reverse;
var i,j:integer;
    tmp: real;
begin
    for i := 1 to rowIndex do begin
        for j := 1 to (m div 2) do begin
            tmp := x[i,m-j+1];
            x[i,m-j+1] := x[i,j];
            x[i,j] := tmp;
        end;
    end;
end;

initialization

finalization
end.