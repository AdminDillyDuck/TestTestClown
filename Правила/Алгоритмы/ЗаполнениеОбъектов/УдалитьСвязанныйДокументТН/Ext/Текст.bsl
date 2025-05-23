﻿УникальныйИдентификаторИсточникаСтрокой = ПараметрыОбъекта.Получить("УИДТН");

Запрос = Новый Запрос;
Запрос.Текст = "ВЫБРАТЬ
|	кси_СозданныеДокументыНаОснованииТН.СозданныйДокумент КАК СозданныйДокумент
|ИЗ
|	РегистрСведений.кси_СозданныеДокументыНаОснованииТН КАК кси_СозданныеДокументыНаОснованииТН
|ГДЕ
|	кси_СозданныеДокументыНаОснованииТН.УИДДокументаОснования = &УИДДокументаОснования
|
|УПОРЯДОЧИТЬ ПО
|	СозданныйДокумент УБЫВ
|АВТОУПОРЯДОЧИВАНИЕ";

Запрос.УстановитьПараметр("УИДДокументаОснования", УникальныйИдентификаторИсточникаСтрокой);

РезультатЗапроса = Запрос.Выполнить();

Если НЕ РезультатЗапроса.Пустой() Тогда
	
	Выборка = РезультатЗапроса.Выбрать();
	
	Пока Выборка.Следующий() Цикл
		
		Если Выборка.СозданныйДокумент = Объект.Ссылка Тогда
			Продолжить;
		КонецЕсли;
		
		НайденныйДокументОбъект = Выборка.СозданныйДокумент.ПолучитьОбъект();
		НайденныйДокументОбъект.ПометкаУдаления = Истина;
		
		Если НайденныйДокументОбъект.Проведен Тогда 
			НайденныйДокументОбъект.Записать(РежимЗаписиДокумента.ОтменаПроведения);
		Иначе
			НайденныйДокументОбъект.Записать(РежимЗаписиДокумента.Запись);
		КонецЕсли;
		
	КонецЦикла;
	
КонецЕсли;

МенеджерЗаписи = РегистрыСведений.кси_СозданныеДокументыНаОснованииТН.СоздатьМенеджерЗаписи();
//МенеджерЗаписи.СозданныйДокумент 		= ?(ОбъектНайден, Ссылка, Объект.Ссылка);
МенеджерЗаписи.СозданныйДокумент 		= Объект.Ссылка;
МенеджерЗаписи.УИДДокументаОснования 	= УникальныйИдентификаторИсточникаСтрокой;
МенеджерЗаписи.Записать();