﻿	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ РАЗРЕШЕННЫЕ
	|	КорректировкаДолгаСуммыДолга.Ссылка КАК Ссылка,
	|	КОЛИЧЕСТВО(РАЗЛИЧНЫЕ КорректировкаДолгаСуммыДолга.СтатьяЗатрат) КАК КоличествоРазличныхСтатейЗатрат
	|ПОМЕСТИТЬ ВТ_Документы
	|ИЗ
	|	Документ.КорректировкаДолга.СуммыДолга КАК КорректировкаДолгаСуммыДолга
	|ГДЕ
	|	КорректировкаДолгаСуммыДолга.Ссылка.ВидОперации = ЗНАЧЕНИЕ(Перечисление.ВидыОперацийКорректировкаДолга.СписаниеЗадолженности)
	|	И КорректировкаДолгаСуммыДолга.Ссылка.КонтрагентДебитор.НеЯвляетсяРезидентом
	//1СTeam Карпухин Д.С. 24.02.2022 [T1C-2003] НАЧАЛО 
	|	И КорректировкаДолгаСуммыДолга.СтатьяЗатрат = ЗНАЧЕНИЕ(Справочник.СтатьиЗатрат.ПустаяСсылка)
	//1СTeam Карпухин Д.С. 24.02.2022 [T1C-2003] КОНЕЦ 
	|	И КорректировкаДолгаСуммыДолга.Ссылка = &Ссылка
	|	И КорректировкаДолгаСуммыДолга.СчетКт В ИЕРАРХИИ(&Счет62)
	|
	|СГРУППИРОВАТЬ ПО
	|	КорректировкаДолгаСуммыДолга.Ссылка
	|;
	|
	|////////////////////////////////////////////////////////////////////////////////
	|ВЫБРАТЬ РАЗРЕШЕННЫЕ
	|	КорректировкаДолгаСуммыДолга.Ссылка КАК Ссылка
	|ИЗ
	|	ВТ_Документы КАК ВТ_Документы
	|		ВНУТРЕННЕЕ СОЕДИНЕНИЕ Документ.КорректировкаДолга.СуммыДолга КАК КорректировкаДолгаСуммыДолга
	|		ПО ВТ_Документы.Ссылка = КорректировкаДолгаСуммыДолга.Ссылка
	|ГДЕ
	|	ВТ_Документы.КоличествоРазличныхСтатейЗатрат = 1
	|	И КорректировкаДолгаСуммыДолга.СтатьяЗатрат = ЗНАЧЕНИЕ(Справочник.СтатьиЗатрат.ПустаяСсылка)
	|
	|СГРУППИРОВАТЬ ПО
	|	КорректировкаДолгаСуммыДолга.Ссылка";
	
	Запрос.УстановитьПараметр("Ссылка", Объект.Ссылка);
	Запрос.УстановитьПараметр("Счет62", ПланыСчетов.УБИ_ПланСчетовУУ.НайтиПоКоду("62"));
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Если НЕ РезультатЗапроса.Пустой() Тогда
		
		//Выборка = РезультатЗапроса.Выбрать();
		//Выборка.Следующий();		
		
		//ВыгрузитьПоПравилу(Выборка.Ссылка,,,, "КорректировкаДолгаПоНерезидентам");	
		ИмяПКО = "КорректировкаДолгаПоНерезидентам";
		
	//Иначе
		
		//ВыгрузитьПоПравилу(Объект.Ссылка,,,, "КорректировкаДолга");	
		
	КонецЕсли;
