﻿// 1СTeam Калмыков П.Н. 07.05.2024 [T1C-3427] НАЧАЛО
//Значение = Неопределено;
Если Источник.ВидОперации = Перечисления.ВидыОперацийКорректировкаДолга.СписаниеЗадолженности Тогда
	Если Источник.СуммыДолга.Количество() > 0 Тогда
		Значение = Источник.СуммыДолга[0].СтатьяЗатрат;
	КонецЕсли
Иначе	
	Значение = Неопределено;
КонецЕсли;
// 1СTeam Калмыков П.Н. 07.05.2024 [T1C-3427] КОНЕЦ