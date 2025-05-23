﻿Если НЕ Источник.Организация = Параметры.ОрганизацияВыгрузки Тогда
	Отказ = Истина;
КонецЕсли;

Выполнить(Алгоритмы.МожноВыгружатьДокумент);

// -- получаем счет учета --
МассивНоменклатура = Новый Массив();
МассивНоменклатура.Добавить(Справочники.Номенклатура.ПустаяСсылка());

МассивНоменклатура.Добавить(Источник.Номенклатура);
СписокГрупп = УправлениеВзаиморасчетами.ПолучитьСписокВышестоящихГрупп(Источник.Номенклатура);
Для Каждого Элемент из СписокГрупп Цикл
	МассивНоменклатура.Добавить(Элемент);
КонецЦикла;

ТестЗапрос = Новый Запрос();

ТестЗапрос.УстановитьПараметр("Организация", Источник.Организация);
ТестЗапрос.УстановитьПараметр("Номенклатура", МассивНоменклатура);

ТестЗапрос.Текст = 
"ВЫБРАТЬ
|	СчетаУчетаНоменклатуры.СчетУчетаБУ КАК СчетУчетаБУ,
|	СчетаУчетаНоменклатуры.Номенклатура КАК Номенклатура
|ИЗ
|	РегистрСведений.УБИ_СчетаУчетаНоменклатуры КАК СчетаУчетаНоменклатуры
|ГДЕ
|	СчетаУчетаНоменклатуры.Номенклатура В(&Номенклатура)
|	И СчетаУчетаНоменклатуры.Организация = &Организация";

ТаблицаЗапроса = ТестЗапрос.Выполнить().Выгрузить();
ТаблицаЗапроса.Колонки.Добавить("Глубина");
Для Каждого Строка из ТаблицаЗапроса Цикл
	Если Строка.Номенклатура = Справочники.Номенклатура.ПустаяСсылка() Тогда
		Строка.Глубина = 0;
	Иначе
		Строка.Глубина = СтрДлина(Строка.Номенклатура.ПолныйКод());
	КонецЕсли;
КонецЦикла;

ТаблицаЗапроса.Сортировать("Глубина Убыв");

Если ТаблицаЗапроса.Количество() > 0 Тогда
	СчетУчетаБУ = ТаблицаЗапроса[0].СчетУчетаБУ.Код;
КонецЕсли;

Если Не Отказ и СчетУчетаБУ = "43" и Источник.Комплектующие.Количество() > 0
	и Источник.ВидОперации = Перечисления.ВидыОперацийКомплектацияНоменклатуры.Комплектация Тогда
	
	// -- Создаем "Отчет производства за смену", поэтому от создании комплектации номеклатуры отказываемся --
	Отказ = Истина;
	ВыгрузитьПоПравилу(Источник, , Новый Структура("МожноВыгружать", Истина), ,"КомплектацияНоменклатурыОПС");
	
КонецЕсли;