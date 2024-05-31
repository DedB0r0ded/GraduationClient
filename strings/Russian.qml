pragma Singleton

import QtQuick

// TODO: Describe strings in the same way as colorSchemes
QtObject{
  readonly property string projectName: 'Frius'

  readonly property var menu: {
    'profile'       : 'Профиль',
    'tasks'         : 'Задачи',
    'organisations' : 'Организации',
    'contracts'     : 'Договоры',
    'developer'     : 'Разработчик',
    'signOut'       : 'Выход',

    'banks'         : 'Банки',
    'components'    : 'Компоненты',
    'facilities'    : 'Оборудование',
    'services'      : 'Услуги',
    'manufacturers' : 'Изготовители',
    'back'          : 'Назад'
  }

  readonly property var labels: {
    'firstName'           : 'Имя',
    'middleName'          : 'Отчество',
    'lastName'            : 'Фамилия',
    'email'               : 'Электронная почта',
    'notifications'       : 'Уведомления',
    'expiringContracts'   : 'Истекает срок договора',
    'maintenanceRequired' : 'Необходимо ТО',
    'changeRequired'      : 'Необходима замена',
    'urgentMaintenance'   : 'Заявки на срочное ТО'
  }

  readonly property var tableHeaders: {
    'globalManufacturerName'  : 'Наименование',
    'globalManufacturerCode'  : 'Код',

    'globalServiceName'             : 'Наименование',
    'globalServiceDefaultFacility'  : 'Оборудование по умолчанию',
    'globalServiceDefaultComponent' : 'Компонент по умолчанию',

    'globalFacilityName'            : 'Наименование',
    'globalFacilityManufacturer'    : 'Изготовитель',
    'globalFacilityManufactureYear' : 'Год выпуска',
    'globalFacilityWarrantyPeriod'  : 'Срок гарантии',

    'globalComponentName'            : 'Наименование',
    'globalComponentManufacturer'    : 'Изготовитель',
    'globalComponentManufactureYear' : 'Год выпуска',
    'globalComponentWarrantyPeriod'  : 'Срок гарантии',

    'globalFacilityComponentName' : 'Наименование компонента',

    'globalBankName'    : 'Наименование',
    'globalBankAddress' : 'Адрес',
    'globalBankRCBIC'   : 'БИК',
  }

  readonly property var placeholders: {
    'userFirstName' : 'ИМЯ_ПОЛЬЗОВАТЕЛЯ',
    'userMiddleName' : 'ОТЧЕСТВО_ПОЛЬЗОВАТЕЛЯ',
    'userLastName' : 'ФАМИЛИЯ_ПОЛЬЗОВАТЕЛЯ',

    'address' : 'АДРЕС',

    'facilityName'      : 'НАИМЕНОВАНИЕ_ОБОРУДОВАНИЯ',
    'componentName'     : 'НАИМЕНОВАНИЕ_КОМПОНЕНТА',
    'bankName'          : 'НАИМЕНОВАНИЕ_БАНКА',
    'rcbic'             : 'БИКБИКБИК',
    'manufactureYear'   : '0000',
    'warrantyPeriod'    : '00_ЛЕТ',
    'serviceName'       : 'НАИМЕНОВАНИЕ_УСЛУГИ',
    'manufacturerName'  : 'НАИМЕНОВАНИЕ_ИЗГОТОВИТЕЛЯ',
    'manufacturerCode'  : 'КОДБ',


  }
}
