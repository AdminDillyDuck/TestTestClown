﻿Если Параметры.АвтоЗачетОплаты Тогда
	Отказ = Истина; 	
ИначеЕсли ТипЗнч(ОбъектКоллекции.ДокументРасчетовСКонтрагентом) = Тип("ДокументСсылка.РасходныйКассовыйОрдер") Тогда
	ИмяПКО = "РасходныйКассовыйОрдер";
ИначеЕсли ТипЗнч(ОбъектКоллекции.ДокументРасчетовСКонтрагентом) = Тип("ДокументСсылка.ПлатежноеПоручениеИсходящее") Тогда
	ИмяПКО = "ПлатежноеПоручениеИсходящее";
ИначеЕсли ТипЗнч(ОбъектКоллекции.ДокументРасчетовСКонтрагентом) = Тип("ДокументСсылка.ПлатежныйОрдерСписаниеДенежныхСредств") Тогда
	ИмяПКО = "ПлатежныйОрдерСписаниеДенежныхСредств";
ИначеЕсли ТипЗнч(ОбъектКоллекции.ДокументРасчетовСКонтрагентом) = Тип("ДокументСсылка.КорректировкаДолга") Тогда
	ИмяПКО = "КорректировкаДолга";
ИначеЕсли ТипЗнч(ОбъектКоллекции.ДокументРасчетовСКонтрагентом) = Тип("ДокументСсылка.АвансовыйОтчет") Тогда
	ИмяПКО = "АвансовыйОтчет";
ИначеЕсли ТипЗнч(ОбъектКоллекции.ДокументРасчетовСКонтрагентом) = Тип("ДокументСсылка.ВозвратТоваровПоставщику") Тогда
	ИмяПКО = "ВозвратТоваровПоставщику";	
Иначе
	Отказ = Истина;
КонецЕсли;