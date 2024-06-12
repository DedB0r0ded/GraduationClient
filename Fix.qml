pragma Singleton

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls



import "strings"
import "types/basic"
import "types"
import "dialogs"
import "config"
import "colorSchemes"
import "js"
import "pages"

QtObject{
  property bool isDeveloper: false
  property bool isClient: true
  property bool isIvan: false

  property var contract1: {
    "customer": "ОАО «Речицадрев»",
    "contractor": "СП ОАО «Брестгазоаппарат»",
    "conclusionDate": "10.06.2020",
    "expiresOn": "10.06.2020",
    "continuous": false,
    "customerName": "ОАО «Речицадрев»",
    "customerAddress": "Республика Беларусь, 247500  г. Речица ул. 10 лет Октября, 17/19",
    "customerFax": "+375 17 318-87-84",
    "customerRcbic": "BY80 SLAN 3012 2004 9001 7000 0000",
    "contractorName": "СП ОАО «Брестгазоаппарат» ",
    "contractorAddress": "Минская обл., Пуховичский р-н, 222823, Г.п. Свислочь, ул.Партизанская, д.2",
    "contractorFax": "+375 17 372-67-19",
    "contractorRcbic": "BY15 BAPB 3012 2005 9001 4000 0000",
  }

  property var contract2: {
    "contractor": "ОАО «Речицадрев»",
    "customer": "СП ОАО «Брестгазоаппарат»",
    "conclusionDate": "20.01.2023",
    "expiresOn": "20.01.2024",
    "continuous": true,
    "contractorName": "ОАО «Речицадрев»",
    "contractorAddress": "Республика Беларусь, 247500  г. Речица ул. 10 лет Октября, 17/19",
    "contractorFax": "+375 17 318-87-84",
    "contractorRcbic": "BY80 SLAN 3012 2004 9001 7000 0000",
    "customerName": "СП ОАО «Брестгазоаппарат» ",
    "customerAddress": "Минская обл., Пуховичский р-н, 222823, Г.п. Свислочь, ул.Партизанская, д.2",
    "customerFax": "+375 17 372-67-19",
    "customerRcbic": "BY15 BAPB 3012 2005 9001 4000 0000",
  }

  property var org1: {
    "name": "ОАО «МОЛОЧНЫЙ МИР»",
    "fax": "+375 17 132-43-22",
    "tid": "600125053",
    "address": "Минская обл., Пуховичский р-н, 222823, Г.п. Свислочь, ул.Партизанская, д.2"
  }

  property var reviews: [
    {
      "org": "ООО «Праймилк»",
      "quality": "8",
      "details": "Всегда стараются помочь своим клиентам, но иногда допускают ошибки.",
    },
    {
      "org": "ЗАО «БЕЛТЯЖМАШ»",
      "quality": "6",
      "details": "Ничего примечательного.",
    },
    {
      "org": "ИП Зайцев",
      "quality": "10",
      "details": "Молодчина! Делает свою работу лучше крупных компаний! 10 из 10!",
    },
    {
      "org": "ЗАО «Выставочный центр «АКВАБЕЛ» Минский район»",
      "quality": "3",
      "details": "Очень привередливый заказчик.",
    },
    {
      "org": "ОАО «Завод горного воска»",
      "quality": "9",
      "details": "Работают почти без нареканий. Возможны лишь небольшие недочеты.",
    },
  ]

  property var facilities: [
    {
      "name": "YIA-HW-14F3",
      "description": "АБХМ на горячей воде"
    },
    {
      "name": "RXZ-85",
      "description": "АБХМ на горячей воде"
    },
    {
      "name": "BDS148XI0.6-82/60-27.6/35-300-R1",
      "description": "АБТН"
    },
  ]

  property var components: [
    {
      "name": "Датчик температуры калибровочный (T2A)",
      "description": "тип датчика PT100, L=80"
    },
    {
      "name": "Heating water temp. sensor*(T8)",
      "description": "датчик темп-ры нагреваемой  воды. PT1000, L=60"
    },
    {
      "name": "реле протока охлаждаемой воды (B1、B1A B3)",
      "description": "тип датчика: лепесткового типа"
    },
  ]

  property var manufacturers: [
    {
      "code":"ФБЛК",
      "name":"Фабрика балок",
    },
    {
      "code":"ОАСО",
      "name":"ОАО \"Сода\"",
    },
    {
      "code":"ЧИМЕ",
      "name":"ЧУП Чина-Мейд",
    },
  ]

  property var users: [
    {
      "email": "client@mail.ru",
      "password": "1",
      "fn": "Алексей",
      "mn": "Алексеевич",
      "ln": "Алексеев",
      "client": true
    },
    {
      "email": "usr@mail.ru",
      "password": "1",
      "fn": "Иван",
      "mn": "Иванович",
      "ln": "Иванов",
      "client": false
    },
  ]

  property var organisations: [
    {
      "name": "ОАО «МОЛОЧНЫЙ МИР»",
      "fax": "+375 17 132-43-22",
      "tid": "600125053",
      "address": "Минская обл., Пуховичский р-н, 222823, Г.п. Свислочь, ул.Партизанская, д.2",
    },
    {
      "name": "СП ОАО «Брестгазоаппарат»",
      "fax": "+375 17 111-44-22",
      "tid": "600000000",
      "address": "Республика Беларусь, 224016, г. Брест, ул. Орджоникидзе, 22",
    },

  ]

  function authorized(user){
    users.forEach(u => {
      if(u.email === user.email && u.password === user.password)
        return true;})
    return false;
  }
}
