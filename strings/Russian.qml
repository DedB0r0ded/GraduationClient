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

    'regKeyUserFullName'  : 'ФИО Пользователя',
    'regKeyShortValue'    : 'Ключ',

    'taskUserFullName'      : 'ФИО исполнителя',
    'taskCreatorFullName'   : 'ФИО создателя',
    'taskOrganisationName'  : 'Организация',
    'taskSubject'           : 'Название',
    'taskCompleted'         : 'Выполнена',
    'taskCreatedOn'         : 'Дата создания',
    'taskExpiresOn'         : 'Срок выполнения',

    'organisationName'    : 'Наименование',
    'organisationAddress' : 'Юр. адрес',
    'organisationTID'     : 'ИНН/УНП/ОКПО',

    'organisationServiceName'             : 'Наименование',
    'organisationServiceCost'             : 'Стоимость',
    'organisationServiceDefaultFacility'  : 'Оборудование по умолчанию',
    'organisationServiceDefaultComponent' : 'Компонент по умолчанию',

    'contractCustomerName'    : 'Заказчик',
    'contractContractorName'  : 'Исполнитель',
    'contractConclusionDate'  : 'Дата заключения',
    'contractExpirationDate'  : 'Дата истечения',
    'contractContinuous'      : 'Тип договора',
  }

  readonly property var placeholders: {
    'userFirstName'   : 'ИМЯ_ПОЛЬЗОВАТЕЛЯ',
    'userMiddleName'  : 'ОТЧЕСТВО_ПОЛЬЗОВАТЕЛЯ',
    'userLastName'    : 'ФАМИЛИЯ_ПОЛЬЗОВАТЕЛЯ',
    'userFullName'    : 'ФАМИЛИЯ И.О.',

    'organisationName' : 'НАИМЕНОВАНИЕ_ОРГАНИЗАЦИИ',
    'address'   : 'АДРЕС',
    'tid'       : 'AAAAA00',
    'date'      : '00.00.0000',
    'shortText' : 'Lorem ipsum dolor sit amet',
    'longText'  : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam lectus purus, suscipit eget tortor ac, pellentesque blandit leo. Sed eget tellus a neque pharetra lobortis ut et leo. Nunc elementum.',

    'facilityName'      : 'НАИМЕНОВАНИЕ_ОБОРУДОВАНИЯ',
    'componentName'     : 'НАИМЕНОВАНИЕ_КОМПОНЕНТА',
    'bankName'          : 'НАИМЕНОВАНИЕ_БАНКА',
    'rcbic'             : 'БИКБИКБИК',
    'manufactureYear'   : '0000',
    'warrantyPeriod'    : '00_ЛЕТ',
    'serviceName'       : 'НАИМЕНОВАНИЕ_УСЛУГИ',
    'manufacturerName'  : 'НАИМЕНОВАНИЕ_ИЗГОТОВИТЕЛЯ',
    'manufacturerCode'  : 'КОДБ',

    'regKeyShortValue'  : '1f7a520a',
    'regKeyFullValue'   : '0e97b1a3818461f7a520a467b1a38c1f7a520a467b1a38c1ff7a57a520a47',
    'privilegeName'     : 'ВЫПОЛНЯТЬ_ДЕЙСТВИЕ'
  }
}
