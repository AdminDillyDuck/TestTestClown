﻿Если Объект.ВидОперации = Перечисления.ВидыОперацийРеализацияТоваров.РеализацияУслугПоПереработке Тогда
	
	ВыгрузитьПоПравилу(Объект,,,,"РеализацияУслугПоПереработке");
	
ИначеЕсли  Объект.ВидОперации = Перечисления.ВидыОперацийРеализацияТоваров.РеализацияОтгруженныхТоваров Тогда
	
	ВыгрузитьПоПравилу(Объект,,,,"РеализацияОтгруженныхТоваров");
	
Иначе  	
	
	ВыгрузитьПоПравилу(Объект,,,,"РеализацияТоваровУслуг");
	
КонецЕсли