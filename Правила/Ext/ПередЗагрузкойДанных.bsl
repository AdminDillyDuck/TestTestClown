﻿Параметры.Вставить("ВалютаРегламентированногоУчета", ОбщегоНазначенияБПВызовСервераПовтИсп.ПолучитьВалютуРегламентированногоУчета());
Параметры.Вставить("ОбъектыКУдалению", Новый Массив);
Параметры.Вставить("ОсновнаяОрганизация", ОбщегоНазначенияБПВызовСервера.ПолучитьЗначениеПоУмолчанию("ОсновнаяОрганизация"));
Параметры.Вставить("ДокументыСОпределениемДопРеквизитов",Новый Массив);

ТоварыТабличнаяЧасть = Новый ТаблицаЗначений();
ТоварыТабличнаяЧасть.Колонки.Добавить("Ссылка");
ТоварыТабличнаяЧасть.Колонки.Добавить("ТоварыТабличнаяЧасть", Новый ОписаниеТипов("ТаблицаЗначений"));
ТоварыТабличнаяЧасть.Индексы.Добавить("Ссылка");
Параметры.Вставить("ТоварыТабличнаяЧасть", ТоварыТабличнаяЧасть);
Параметры.Вставить("ДокументыЗагруженныеИзНесоовпадающихТиповДокументов", Новый Массив());