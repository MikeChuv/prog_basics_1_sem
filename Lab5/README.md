# Лабораторная работа №5

#### Постановка задачи.
Для заданных массивов **_X_**, **_Y_** и **_Z_** получить новые значения элементов этих массивов, последовательно рассматривая тройки (**Xi**, **Yi**, **Zi**): **Xi** следует задать наименьшее из этих значений, **Zi** – наибольшее, а **Yi** – оставшееся значение данной тройки.
#### Таблица данных

Класс | Имя | Смысл | Тип | Структура |
---- | --- | ----- | --- | --------- |
Входные данные | x,y,z | массивы | вещ. | массив |
Входные данные | n | количество элементов массива |   цел.| прост. перем  |
Промежуточные данные | i | счетчик | вещ. | прост. перем |
Выходные данные | x,y,z | массивы | вещ. | массив |

#### Входная форма
Введите количество элементов массивов
Введите элемент массива

#### Выходная форма
Вывод  исходных массивов
Вывод  результирующих массивов
#### Аномалии
n <= 0
n > 100



#### Тестовые примеры
![Тест 1](https://sun9-39.userapi.com/c853420/v853420427/109288/XGBqYzZXKf4.jpg)
![Тест 2](https://sun9-53.userapi.com/c853420/v853420427/1092b6/R8NymNlUEfc.jpg)

#### Метод
Выполнение сортировки в каждой тройки элементов **Xi**, **Yi**, **Zi**:
Сравниваем **Xi** и **Yi**, если **Xi** > **Yi**, меняем их содержимое местами
Аналогично с **Yi** и **Zi**
Еще раз повторяем с **Xi** и **Yi**, если в **Zi** был наименьший в тройке элемент
#### Алгоритм
   
![Алгоритм](https://sun9-53.userapi.com/c857432/v857432089/92692/WRHfDCzR-sw.jpg)


![Ввод](https://sun9-62.userapi.com/c857432/v857432089/926a0/j9nEcUIXuis.jpg)


![Вывод](https://sun9-49.userapi.com/c857432/v857432089/92699/6ZIEhGIZvFg.jpg)
#### Программа
```pascal
program lab5_var30;
const nmax = 100;
type mas = array[1..nmax] of real;

var x,y,z: mas;
	n,i:byte;
	tmp: real;


procedure vvod(var x:mas; n:byte);
var i:byte;
begin
	for i:=1 to n do begin
		writeln('Введите эдемент массива [',i,']');
		readln(x[i]);
	end;
end;


procedure vivod(var x:mas; n:byte);
var i:byte;
begin
	for i:=1 to n do
		write(x[i]:4:2,' ');
	writeln;
end;



begin
	write('Введите количество элементов в массиве');
	readln(n);
	if (n > nmax) or (n <= 0) then writeln('Неверно заданы исходные данные')
	else
	begin
		writeln('Ввод массива x');
		vvod(x,n);
		writeln('Ввод массива y');
		vvod(y,n);
		writeln('Ввод массива z');
		vvod(z,n);
		writeln('Вывод исходных массивов');
		vivod(x,n);
		vivod(y,n);
		vivod(z,n);
		for i:= 1 to n do begin
			if x[i] > y[i] then begin
				tmp := x[i];
				x[i] := y[i];
				y[i] := tmp;
			end;
			if y[i] > z[i] then begin
				tmp := y[i];
				y[i] := z[i];
				z[i] := tmp;
			end;
			if x[i] > y[i] then begin
				tmp := x[i];
				x[i] := y[i];
				y[i] := tmp;
			end;
		end;
		writeln('Вывод массивов');
		vivod(x,n);
		vivod(y,n);
		vivod(z,n);
	end;
end.
```
