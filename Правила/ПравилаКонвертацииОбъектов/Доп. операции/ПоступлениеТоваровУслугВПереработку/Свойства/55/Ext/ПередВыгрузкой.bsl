﻿Если ЗначениеЗаполнено(Источник.СкладОрдер) Тогда
	Если Источник.ВидПоступления = Перечисления.ВидыПоступленияТоваров.ПоОрдеру Тогда
		ВремСклад = Источник.СкладОрдер.Склад;
	Иначе
		ВремСклад = Источник.СкладОрдер;
	КонецЕсли;
	
	мСклад = ВремСклад;
	Выполнить(Алгоритмы.ОпределитьСкладВыгрузки);
КонецЕсли;