﻿КоллекцияОбъектов = Новый ТаблицаЗначений;
КоллекцияОбъектов.Колонки.Добавить("Тип");
КоллекцияОбъектов.Колонки.Добавить("Вид");
КоллекцияОбъектов.Колонки.Добавить("Представление");
КоллекцияОбъектов.Колонки.Добавить("ЗначенияПолей");
КоллекцияОбъектов.Колонки.Добавить("Страна");
КоллекцияОбъектов.Колонки.Добавить("Регион");
КоллекцияОбъектов.Колонки.Добавить("Город");
КоллекцияОбъектов.Колонки.Добавить("АдресЭП");
КоллекцияОбъектов.Колонки.Добавить("ДоменноеИмяСервера");
КоллекцияОбъектов.Колонки.Добавить("НомерТелефона");
КоллекцияОбъектов.Колонки.Добавить("НомерТелефонаБезКодов");

Запрос = Новый Запрос("
|ВЫБРАТЬ
|	КонтактнаяИнформация.Тип КАК Тип,
|	КонтактнаяИнформация.Вид КАК Вид,
|	КонтактнаяИнформация.Представление КАК Представление,
|	КонтактнаяИнформация.Поле1 КАК Поле1,
|	КонтактнаяИнформация.Поле2 КАК Поле2,
|	КонтактнаяИнформация.Поле3 КАК Поле3,
|	КонтактнаяИнформация.Поле4 КАК Поле4,
|	КонтактнаяИнформация.Поле5 КАК Поле5,
|	КонтактнаяИнформация.Поле6 КАК Поле6,
|	КонтактнаяИнформация.Поле7 КАК Поле7,
|	КонтактнаяИнформация.Поле8 КАК Поле8,
|	КонтактнаяИнформация.Поле9 КАК Поле9,
|	"""" КАК ТипДома,
|	"""" КАК ТипКорпуса,
|	"""" КАК ТипКвартиры
|ИЗ
|	РегистрСведений.КонтактнаяИнформация КАК КонтактнаяИнформация
|ГДЕ
|	КонтактнаяИнформация.Объект = &Контрагент
|	И НЕ КонтактнаяИнформация.Вид В (
|	ЗНАЧЕНИЕ(Справочник.ВидыКонтактнойИнформации.АдресДоставкиКонтрагента),
|	ЗНАЧЕНИЕ(Справочник.ВидыКонтактнойИнформации.КонтактнТелефонКандидата)
|)
|");

Запрос.УстановитьПараметр("Контрагент", ?(ТипЗнч(Источник.Ссылка) = Тип("СправочникСсылка.КонтактныеЛица"), ВходящиеДанные.КонтактноеЛицоКонтрагента, Источник.Ссылка));

Выборка = Запрос.Выполнить().Выбрать();
Пока Выборка.Следующий() Цикл
	НоваяСтрока = КоллекцияОбъектов.Добавить();
	ЗаполнитьЗначенияСвойств(НоваяСтрока, Выборка);

	Если Выборка.Тип = Перечисления.ТипыКонтактнойИнформации.Адрес Тогда
		
		Если ЗначениеЗаполнено(Выборка.ТипДома) Тогда
			ТипДома = НРег(Выборка.ТипДома.Метаданные().ЗначенияПеречисления[Перечисления.ТипыДомов.Индекс(Выборка.ТипДома)].Имя);
		Иначе
			ТипДома = Выборка.ТипДома;
		КонецЕсли;
		
		Если ЗначениеЗаполнено(Выборка.ТипКорпуса) Тогда
			ТипКорпуса = НРег(Выборка.ТипКорпуса.Метаданные().ЗначенияПеречисления[Перечисления.ТипыКорпусов.Индекс(Выборка.ТипКорпуса)].Имя);
		Иначе
			ТипКорпуса = Выборка.ТипКорпуса;
		КонецЕсли;
		
		Если ЗначениеЗаполнено(Выборка.ТипКвартиры) Тогда
			ТипКвартиры = ?(Выборка.ТипКвартиры = Перечисления.ТипыКвартир.Квартира,
				"кв.", НРег(Выборка.ТипКвартиры.Метаданные().ЗначенияПеречисления[Перечисления.ТипыКвартир.Индекс(Выборка.ТипКвартиры)].Имя));
		Иначе
			ТипКвартиры = Выборка.ТипКвартиры;
		КонецЕсли;				
		
		НоваяСтрока.ЗначенияПолей = ?(ЗначениеЗаполнено(Выборка.Поле1), "Индекс=" + Выборка.Поле1 + Символы.ПС, "")
		   + ?(ЗначениеЗаполнено(Выборка.Поле2), "Регион="			+ Выборка.Поле2 + Символы.ПС, "")
		   + ?(ЗначениеЗаполнено(Выборка.Поле3), "Район="			+ Выборка.Поле3 + Символы.ПС, "")
		   + ?(ЗначениеЗаполнено(Выборка.Поле4), "Город="			+ Выборка.Поле4 + Символы.ПС, "") 
		   + ?(ЗначениеЗаполнено(Выборка.Поле5), "НаселенныйПункт="	+ Выборка.Поле5 + Символы.ПС, "")
		   + ?(ЗначениеЗаполнено(Выборка.Поле6), "Улица="			+ Выборка.Поле6 + Символы.ПС, "")
		   + ?(ЗначениеЗаполнено(Выборка.Поле7), "Дом="				+ Выборка.Поле7 + Символы.ПС, "")
		   + ?(ЗначениеЗаполнено(Выборка.Поле8), "Корпус="			+ Выборка.Поле8 + Символы.ПС, "")
		   + ?(ЗначениеЗаполнено(Выборка.Поле9), "Квартира="		+ Выборка.Поле9 + Символы.ПС, "")
		   + ?(ЗначениеЗаполнено(ТипДома),		 "ТипДома="			+ ТипДома		+ Символы.ПС, "")
		   + ?(ЗначениеЗаполнено(ТипКорпуса),	 "ТипКорпуса="		+ ТипКорпуса	+ Символы.ПС, "")
		   + ?(ЗначениеЗаполнено(ТипКвартиры),	 "ТипКвартиры="		+ ТипКвартиры, "");
		   
	ИначеЕсли Выборка.Тип = Перечисления.ТипыКонтактнойИнформации.Телефон Тогда
		
		НоваяСтрока.ЗначенияПолей = ?(ЗначениеЗаполнено(Выборка.Поле1), "КодСтраны="     + Выборка.Поле1 + Символы.ПС, "")
		   + ?(ЗначениеЗаполнено(Выборка.Поле2), "КодГорода="     + Выборка.Поле2 + Символы.ПС, "")
		   + ?(ЗначениеЗаполнено(Выборка.Поле3), "НомерТелефона=" + Выборка.Поле3 + Символы.ПС, "")
		   + ?(ЗначениеЗаполнено(Выборка.Поле4), "Добавочный="    + Выборка.Поле4, "");

		НоваяСтрока.НомерТелефонаБезКодов = Выборка.Поле3;
		НоваяСтрока.НомерТелефона         = Выборка.Поле1 + Выборка.Поле2 + Выборка.Поле3;
		
	ИначеЕсли Выборка.Тип = Перечисления.ТипыКонтактнойИнформации.АдресЭлектроннойПочты Тогда
		НоваяСтрока.АдресЭП = Выборка.Представление;
	КонецЕсли;
	
КонецЦикла;