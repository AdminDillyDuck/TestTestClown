﻿// 1СTeam Фасхетдинов Д.М. 24.10.2022 [T1C-2645] НАЧАЛО
//Отк = Ложь;
//ДатыЗапретаИзменения.ПроверитьДатыЗапретаИзмененияДанныхДляОбмена(Объект, Отк);
//Проверка с учетом версий До и внесенных изменений
Отк = ДатыЗапретаИзменения.ИзменениеЗапрещено(Объект);
ОткДо = ?(ОбъектНайден, ДатыЗапретаИзменения.ИзменениеЗапрещено(Объект.Метаданные().ПолноеИмя(), Объект.Ссылка), Отк);
// 1СTeam Фасхетдинов Д.М. 24.10.2022 [T1C-2645] КОНЕЦ

Если Отк Или ОткДо Тогда //Добавили ОткДо. 1СTeam Фасхетдинов Д.М. 24.10.2022 [T1C-2645]
	НеСоздаватьЕслиНеНайден = Истина;
	НеЗамещатьОбъектПриЗагрузке = Истина;
	НЕВыгружатьПодчиненныеОбъекты = Истина;
    Отказ = Истина;
КонецЕсли;

Если ОбъектНайден И Найти(Объект.Ссылка.Ответственный.Наименование, "Исключить из обмена") > 0 Тогда
	Объект = Ссылка.ПолучитьОбъект();
	Отказ = Истина;
Иначе
	
	// 1СTeam Фасхетдинов Д.М. 24.10.2022 [T1C-2645] НАЧАЛО
	Если ОбъектНайден И Объект.Ссылка.ПометкаУдаления И Объект.Проведен И ОткДо Тогда
		Объект.ДополнительныеСвойства.Вставить("ПропуститьПроверкуЗапретаИзменения", Истина);
		Если Отк Тогда
			Объект.Проведен = Ложь;
			Объект.ПометкаУдаления = Истина;
			Отк = Ложь;
		КонецЕсли;
	КонецЕсли;
	// 1СTeam Фасхетдинов Д.М. 24.10.2022 [T1C-2645] КОНЕЦ	
	
	Объект.ДополнительныеСвойства.Вставить("ОтключитьМеханизмРегистрацииОбъектов", Истина);
	Попытка
		//Отк = Ложь; // Неактуально 1СTeam Фасхетдинов Д.М. 24.10.2022 [T1C-2645]
		//ДатыЗапретаИзменения.ВыполнитьПроверкуДатыЗапретаИзменения(Объект, Отк);
		//Отк = ДатыЗапретаИзменения.ИзменениеЗапрещено(Объект, , Ложь); // Вывели наверх 1СTeam Фасхетдинов Д.М. 24.10.2022 [T1C-2645]
		
		Если Не Отк Тогда
			//Объект.Записать(?(Объект.Проведен, РежимЗаписиДокумента.Проведение, РежимЗаписиДокумента.ОтменаПроведения));
			РежимЗаписи = ?(Объект.Проведен, "Проведение", "ОтменаПроведения");
			// 1СTeam Фасхетдинов Д.М. 18.07.2022 [T1C-2550] НАЧАЛО
			Если РежимЗаписи = "ОтменаПроведения" И Объект.ЭтоНовый() Тогда
				РежимЗаписи = "Запись";	
			КонецЕсли; 
			// 1СTeam Фасхетдинов Д.М. 18.07.2022 [T1C-2550] КОНЕЦ
			
			// 1СTeam Фасхетдинов Д.М. 24.10.2022 [T1C-2645] НАЧАЛО
			Если РежимЗаписи = "Проведение" И Объект.ДополнительныеСвойства.Свойство("ПропуститьПроверкуЗапретаИзменения") Тогда
				Попытка
					Объект.Проведен = Ложь;
					Объект.ПометкаУдаления = Истина;
					Объект.ОбменДанными.Загрузка = Истина;
					Объект.Записать(РежимЗаписиДокумента.Запись);
					Если Метаданные.Документы.СчетФактураВыданный.ТабличныеЧасти.ДокументыОснования.Реквизиты.ДокументОснование.Тип.СодержитТип(ТипЗнч(Объект.Ссылка)) Тогда
						СФ = УчетНДСПереопределяемый.НайтиПодчиненныйСчетФактуруВыданныйНаРеализацию(Объект.Ссылка, , Объект.ПометкаУдаления);
						Если ЗначениеЗаполнено(СФ) И СФ.Дата <> Объект.Дата Тогда
							обСФ = СФ.ПолучитьОбъект();
							обСФ.ДополнительныеСвойства.Вставить("ПропуститьПроверкуЗапретаИзменения", Истина);
							обСФ.Дата = Объект.Дата;
							обСФ.ОбменДанными.Загрузка = Истина;
							обСФ.Записать();
							обСФ.ДополнительныеСвойства.Удалить("ПропуститьПроверкуЗапретаИзменения");
						КонецЕсли;								
					КонецЕсли;
				Исключение
				КонецПопытки;
				Объект.ОбменДанными.Загрузка = Ложь;
				Объект.Проведен = Истина;
				Объект.ПометкаУдаления = Ложь;
				Объект.ДополнительныеСвойства.Удалить("ПропуститьПроверкуЗапретаИзменения");
			КонецЕсли;
			// 1СTeam Фасхетдинов Д.М. 24.10.2022 [T1C-2645] КОНЕЦ
			
			Объект.Записать(РежимЗаписиДокумента[РежимЗаписи]);
		КонецЕсли;
		УдалитьСсылкуНаДокументИзОтложенныхДвижений(Объект.Ссылка);
	Исключение
		Отк = Ложь;
		Попытка
			//ДатыЗапретаИзменения.ВыполнитьПроверкуДатыЗапретаИзменения(Объект, Отк);
			//Отк = ДатыЗапретаИзменения.ИзменениеЗапрещено(Объект, , Ложь);
			Если Не Отк Тогда
				// 1СTeam Фасхетдинов Д.М. 18.07.2022 [T1C-2550] НАЧАЛО
				//Объект.Записать(РежимЗаписиДокумента.ОтменаПроведения);
				Если РежимЗаписи = "Проведение" И Объект.ЭтоНовый() Тогда
					Объект.Проведен = Ложь;
					Объект.Записать(РежимЗаписиДокумента.Запись);
				Иначе
					Объект.Записать(РежимЗаписиДокумента.ОтменаПроведения);								
				КонецЕсли;
				// 1СTeam Фасхетдинов Д.М. 18.07.2022 [T1C-2550] КОНЕЦ
			КонецЕсли;
			
			Если РежимЗаписи = "Проведение" Тогда
			Иначе
				УдалитьСсылкуНаДокументИзОтложенныхДвижений(Объект.Ссылка);
			КонецЕсли;
			
		Исключение
			
			Отказ = Истина;
			
		КонецПопытки;
		
	КонецПопытки;
	//Объект.ОбменДанными.Загрузка = Истина;
КонецЕсли;	

ОбъектМодифицирован = Ложь;
НужноБылоЗаписатьОбъект = Ложь;