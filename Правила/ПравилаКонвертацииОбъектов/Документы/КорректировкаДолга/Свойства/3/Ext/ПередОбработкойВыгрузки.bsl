﻿ТипДокументаРасчетов = "КорректировкаДолга";

ПараметрыОтбора = Новый Структура();
ПараметрыОтбора.Вставить("ВидЗадолженности", Перечисления.ВидыЗадолженности.Дебиторская);
МассивСтрок = Источник.СуммыДолга.НайтиСтроки(ПараметрыОтбора);
КоллекцияОбъектов = Источник.СуммыДолга.Выгрузить(МассивСтрок);

Выполнить(Алгоритмы.ОчиститьНекорректныеТипыДокументовРачетов);