﻿Выполнить(Алгоритмы.МожноВыгружатьДокумент);

ДокСФ = УчетНДС.НайтиПодчиненныйДокумент(Источник.Ссылка, "СчетФактураПолученный");

ВходящиеДанные = Новый Структура();

Если ДокСФ = Неопределено Тогда
	
ВходящиеДанные.Вставить("ДатаИсправления", Дата(1,1,1));
ВходящиеДанные.Вставить("НомерИсправления", "");

Иначе

ВходящиеДанные.Вставить("ДатаИсправления", ДокСФ.ДатаИсправления);
ВходящиеДанные.Вставить("НомерИсправления", ДокСФ.НомерИсправления);

КонецЕсли;