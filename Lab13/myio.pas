unit myio;

interface 
uses mytypes;
var 
    paramsExist, fExists: boolean;
    fin, fout: textfile;

procedure vvod(var x:mas;var n,m: integer;var f:textfile);
procedure vivod(const x:mas; n,m: integer;var f: textfile);

implementation 

procedure vvod;
var i,j: integer;
begin
    readln(f,n,m);
    if (n>nmax) or (m> nmax) or (m<0) or (n<0) then writeln('NZID')
    else begin
        for i := 1 to n do begin
            for j := 1 to m-1 do
                read(f,x[i,j]);
            readln(f,x[i,m]);
            end;
        end;
end;

procedure vivod;
var i,j:integer;
begin
    for i := 1 to n do begin
        for j := 1 to m-1 do 
            write(f,x[i,j]:6:2);
        writeln(f,x[i,m]:6:2); 
        end;
end;

initialization
if ParamCount < 2 then	begin      
	writeln('Недостаточно параметров!');
    paramsExist := false;
    end
else begin
    paramsExist := true;
    fExists := true;
    AssignFile(fin, ParamStr(1));
    Reset(fin);
    AssignFile(fout, ParamStr(2));
    Rewrite(fout);
    end;

finalization
if fExists then begin
    CloseFile(fin);
    CloseFile(fout);
    end;
end.