﻿Если Источник.ВидОперации = Перечисления.ВидыОперацийПоступлениеБезналичныхДенежныхСредств.ВозвратСредствПодотчетником и Источник.РасшифровкаПлатежа.Количество() Тогда
	Значение = Источник.РасшифровкаПлатежа[0].СтатьяДвиженияДенежныхСредств;
КонецЕсли;