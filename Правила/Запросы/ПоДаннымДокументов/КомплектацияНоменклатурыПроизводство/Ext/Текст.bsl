﻿ ВЫБРАТЬ
	КомплектацияНоменклатурыКомплектующие.Номенклатура КАК Номенклатура,
	КомплектацияНоменклатурыКомплектующие.Количество,
	ЕСТЬNULL(ЦеныНоменклатурыСрезПоследних.Цена, 0) * КомплектацияНоменклатурыКомплектующие.Количество КАК Сумма
ИЗ
	Документ.КомплектацияНоменклатуры.Комплектующие КАК КомплектацияНоменклатурыКомплектующие
		ЛЕВОЕ СОЕДИНЕНИЕ РегистрСведений.ЦеныНоменклатуры.СрезПоследних(, ТипЦен = &УчетнаяЦена) КАК ЦеныНоменклатурыСрезПоследних
		ПО КомплектацияНоменклатурыКомплектующие.Номенклатура = ЦеныНоменклатурыСрезПоследних.Номенклатура
			И КомплектацияНоменклатурыКомплектующие.ХарактеристикаНоменклатуры = ЦеныНоменклатурыСрезПоследних.ХарактеристикаНоменклатуры
ГДЕ
	КомплектацияНоменклатурыКомплектующие.Ссылка = &Ссылка