//Для каждой из двух матриц поменять на обратный порядок элементов в тех строках, 
//которые находятся выше строки, в которой максимальна сумма элементов, для которых 
//значение f(xij) положительно. 
program lab13_v30;
uses myio,mytypes,computing;

var 
    a,b: mas;
    an,am,bn,bm: integer;
    k: real;

procedure doAll(var x:mas; var n,m:integer ;var fin,fout:textfile;masname: char);
var k1,k2: integer;
begin
    vvod(x,n,m,fin);
    writeln(fout,'Matrix ', masname ,' Before:'); 
    vivod(x,n,m,fout);
    writeln(fout); writeln(fout);
    k1 := sumIndex(x,n,m,func1) - 1;
    writeln(fout, 'Row Index with func1 = ',k1+1);
    if k1 = 0 then writeln(fout, 'No row with func1(x) > 0')
    else begin 
        reverse(x,n,m,k1);
        writeln(fout,'Matrix ', masname ,' After:'); 
        vivod(x,n,m,fout);
    end;
    writeln(fout); writeln(fout);
    k2 := sumIndex(x,n,m,func2) - 1;
    writeln(fout, 'Row Index with func2 = ',k2+1);
    if k2 = 0 then writeln(fout, 'No row with func2(x) > 0')
    else if (k1<>0) then begin 
        reverse(x,n,m,k1);
        reverse(x,n,m,k2);
        writeln(fout,'Matrix ', masname ,' After:'); 
        vivod(x,n,m,fout);
        end
    else begin
        reverse(x,n,m,k2);
        writeln(fout,'Matrix ', masname ,' After:'); 
        vivod(x,n,m,fout);
    end;
    writeln(fout); writeln(fout);
    writeln(fout,'###########################==========###########################'); 
    writeln(fout); writeln(fout);
end;

begin
if paramsExist and fExists then begin
    doAll(a,an,am,fin,fout,'A');
    doAll(b,bn,bm,fin,fout,'B');
    end;
end.
