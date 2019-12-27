unit computing;

interface 
uses mytypes,myio;

function kolvo(const x:mas; const n,m:integer; num: real):integer;
procedure devide(const x:mas; const n,m:integer);


implementation

function kolvo:integer;
var i,j,r:integer;
    fl: boolean;
    
begin
    fl := true;
    r := 0;
    for i := 1 to n do begin
        j := 1;
        while fl and (j<=m) do begin
            if x[i,j] = num then begin
                fl := false;
            end;
            j := j + 1;
        end;
        if fl then r := r + 1;     
        fl := true;
    end;
    kolvo := r;
end;

procedure devide;
var i,j: integer;
begin
    for i := 1 to n do begin
        for j := 2 to m do
            x[i,j] := x[i,j] / x[i,j-1];
    end;
end;


initialization

finalization
end.