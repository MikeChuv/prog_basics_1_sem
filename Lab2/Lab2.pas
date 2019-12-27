         var ss,sc,cc,cr: real;
         begin

              writeln('Введите центр квадрата и его сторону');
              readln(sc, ss);
              writeln('Введите центр круга и его радиус');
              readln(cc, cr);
              if (cr < 0)or (ss < 0) then writeln('Неверно заданы исходные данные') 
              else
              begin
                   if cc = sc then
                      begin
                           writeln('Концентрические');
                           if sqrt(2*(ss/2))<= cr then writeln('Квадрат вложен в круг');
                           if cr<(ss/2) then writeln('Круг вложен в квадрат');
                      end
                   else
                   begin
                        if (ss < cr) then
                        begin
                           if (sqrt(cr*cr -(abs(sc-cc) + ss/2)*(abs(sc-cc) + ss/2)) >= (ss/2)) then writeln('Квадрат вложен');
                        end
                        else
                            if (abs(sc - cc) + cr) <= (ss/2) then writeln('Круг вложен')
                   end;
                   if abs(sc - cc) <= cr + ss / 2 then  writeln('Пересекаются')
                   else writeln('Не пересекаются');
              end;
         end.
