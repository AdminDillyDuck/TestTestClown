﻿// 1СTeam Томилин А.П. 13.04.2023 [T1C-2864] НАЧАЛО
Если ЗначениеЗаполнено(Источник.ВнутреннийЗаказ)
		И ТипЗнч(Источник.ВнутреннийЗаказ) = Тип("ДокументСсылка.ПоступлениеТоваровУслуг")
		И Источник.СкладОтправитель.Код = ксОбщийМодуль.ПолучитьНастройкуПрограммы("КодСкладаТоварыВПути", Источник.Дата) 
		И Источник.ВидОперации = Перечисления.ВидыОперацийПеремещениеТоваров.ТоварыПродукция
		И Источник.Товары.Количество() > 0 Тогда
	Значение = Источник.ВнутреннийЗаказ;
	ВыгрузитьОбъект = Ложь;
Иначе
	Пусто = Истина;
КонецЕсли;	
// 1СTeam Томилин А.П. 13.04.2023 [T1C-2864] КОНЕЦ