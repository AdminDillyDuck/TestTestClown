﻿Если Объект.ВидОперации = Перечисления.ВидыОперацийКомплектацияНоменклатуры.Производство Тогда
	Отказ = Истина;
	ВыгрузитьПоПравилу(Объект, , Новый Структура("МожноВыгружать", Истина), ,"КомплектацияНоменклатурыПроизводство");
КонецЕсли;