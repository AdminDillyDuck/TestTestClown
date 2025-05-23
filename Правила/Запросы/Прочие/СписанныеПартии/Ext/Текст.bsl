﻿ВЫБРАТЬ
	Партии.Номенклатура,
	Партии.ХарактеристикаНоменклатуры,
	Партии.СерияНоменклатуры,
	Партии.Количество * Партии.Номенклатура.ЕдиницаХраненияОстатков.Коэффициент  КАК Количество,
	Партии.СтатусПартии,
	Партии.ДокументОприходования,
	Партии.Стоимость + ЕСТЬNULL(ПартииКор.Стоимость, 0) КАК Стоимость
ИЗ
	РегистрНакопления.ПартииТоваровНаСкладах КАК Партии
		ЛЕВОЕ СОЕДИНЕНИЕ (ВЫБРАТЬ
			ПартииТоваровНаСкладах.НомерСтрокиСписанныхТоваров КАК НомерСтроки,
			СУММА(ПартииТоваровНаСкладах.Стоимость) КАК Стоимость
		ИЗ
			РегистрНакопления.ПартииТоваровНаСкладах КАК ПартииТоваровНаСкладах
		ГДЕ
			ПартииТоваровНаСкладах.ДокументДвижения = &ДокументСсылка
		    И ПартииТоваровНаСкладах.КодОперации <> ЗНАЧЕНИЕ(Перечисление.КодыОперацийПартииТоваров.ОтложеннаяОтгрузка)
		СГРУППИРОВАТЬ ПО
			ПартииТоваровНаСкладах.НомерСтрокиСписанныхТоваров) КАК ПартииКор
		ПО Партии.НомерСтроки = ПартииКор.НомерСтроки
ГДЕ
	Партии.Регистратор = &ДокументСсылка
	И Партии.ВидДвижения = &Расход