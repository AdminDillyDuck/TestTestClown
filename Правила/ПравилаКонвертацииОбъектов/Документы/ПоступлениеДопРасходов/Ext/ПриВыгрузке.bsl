﻿Если Источник.СпособРаспределения = Перечисления.СпособыРаспределенияДопРасходов.ПоВесу Тогда

	СтруктураШапкиДокумента = Неопределено;
	ТаблицаПоТоварам = Неопределено;

	Источник.ПодготовитьСтруктуруШапкиДокумента("", СтруктураШапкиДокумента, РежимПроведенияДокумента.Неоперативный);
	Источник.ПодготовитьТаблицыДокумента(СтруктураШапкиДокумента, ТаблицаПоТоварам);

	Для каждого СтрокаТовары из ТаблицаПоТоварам цикл
		СтрокаТовары.Стоимость = СтрокаТовары.СуммаУпр + СтрокаТовары.СуммаУпрРаспределения;
		СтрокаТовары.НДС = СтрокаТовары.НДСУпр + СтрокаТовары.НДСУпрРаспределения;
	КонецЦикла;

	ТаблицаСтоимости = ТаблицаПоТоварам.Скопировать(, "НомерСтроки, Стоимость, НДС");
	Параметры.Вставить("ТаблицаСтоимости", ТаблицаСтоимости);

КонецЕсли;