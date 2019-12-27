// Для каждой из трёх матриц определить количество строк, в которых нет элементов, равных заданному числу. 
// Если все строки матрицы не содержат элементов, равных заданному числу, 
// разделить каждый элемент строки на предшествующий ему элемент. Первый элемент строки оставить без изменения. 
program lab13_v30;
uses myio,mytypes,computing;

var 
    a,b,c: mas;
    an,am,bn,bm,cn,cm: integer;
    num,k: real;

procedure doAll(var x:mas; var n,m:integer ;var fin,fout:textfile; var num:real;masname: char);
var k: real;
begin
    vvod(x,n,m,fin);
    writeln(fout,'Matrix ', masname ,' Before:'); 
    vivod(x,n,m,fout);
    writeln(fout); writeln(fout);
    k := kolvo(x,n,m,num);
    writeln(fout, 'Kol-vo = ',k);
    writeln(fout); writeln(fout);
    if k = n then devide(x,n,m);
    writeln(fout,'Matrix ', masname ,' After:'); 
    vivod(x,n,m,fout);
    writeln(fout); writeln(fout);
    writeln(fout,'###########################==========###########################'); 
    writeln(fout); writeln(fout);
end;

begin
if paramsExist and fExists then begin
    readln(fin,num);

    doAll(a,an,am,fin,fout,num,'A');
    doAll(b,bn,bm,fin,fout,num,'B');
    doAll(c,cn,cm,fin,fout,num,'C');

    end;
end.
