pragma Singleton

import QtQuick

// TODO: Describe strings in the same way as colorSchemes
QtObject{
  readonly property string projectName: 'Frius'

  readonly property regexp emailRegExp: /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/

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
    'urgentMaintenance'   : 'Заявки на срочное ТО',
    'colorScheme'         : 'Цветовая схема',
    'lightColorScheme'    : 'Светлая',
    'darkColorScheme'     : 'Тёмная',
    'userOrganisationQuantity' : 'Кол-во организаций:',

    'organisationName'        : 'Наименование',
    'organisationFax'         : 'Факс',
    'organisationAddress'     : 'Юр. адрес',
    'organisationTID'         : 'УНП/ИНН/ИНП',
    'organisationRCBIC'       : 'БИК',
    'organisationBankAccount' : 'Рассчетный счет',
    'organisationBankName'    : 'Банк',
    'organisationBankAddress' : 'Адрес банка',

    'taskShowOption'                : 'Показать:',
    'taskShowOptionSelf'            : 'Мои задачи',
    'taskShowOptionAll'             : 'Все задачи',
    'taskSortOption'                : 'Сортировать по:',
    'taskSortOptionCreationDate'    : 'Дате создания',
    'taskSortOptionExpirationDate'  : 'Сроку выполнения',

    'contractTypeContinuous' : 'Договор на ТО',
    'contractTypeOneTime' : 'Разовый',

    'connectedWith' : 'Вы зарегистрированы в ',
    'noOrganisations' : 'Вы не зарегистрированы ни в одной организации',
    'withOrganisation' : ' организации',
    'withOrganisations' : ' организациях',

  }

  readonly property var dialogs: {
    'logIn'             : 'Вход в аккаунт',
    'signUp'            : 'Регистрация',
    'globalComponent'   : 'Глобальные параметры компонента',
    'globalService'     : 'Глобальный шаблон услуги',
    'localService'      : 'Параметры услуги',
    'contractService'   : 'Параметры услуги',
    'globalFacility'    : 'Глобальные параметры оборудования',
    'contractFacility'  : 'Параметры оборудования',
    'facilityReview'    : 'Отзывы',
  }

  readonly property var buttons: {
    'profileRefreshTasks'         : 'Обновить данные о задачах',
    'profileClearCompletedTasks'  : 'Очистить выполненные',
    'profileDeleteAccount'        : 'Удалить учётную запись',
    'profileSignOut'              : 'Выйти из учетной записи',

    'organisationCreateNew'     : 'Зарегистрировать новую организацию',
    'organisationDelete'        : 'Удалить организацию',
    'organisationShowServices'  : 'Просмотреть услуги',
    'organisationGenerateKeys'  : 'Сгенерировать ключи',
    'returnToOrganisationList'  : 'Вернуться к списку',

    'contractShowServiceList' : 'Подробнее',
    'contractShowObjectList'  : 'Перейти к списку объектов',
    'contractMakeReport'      : 'Сформировать отчёт',

    'signUp'  : 'Зарегистрироваться',
    'logIn'   : 'Войти',
  }

  readonly property var tableHeaders: {
    'globalManufacturerName'    : 'Наименование',
    'globalManufacturerCode'    : 'Код',
    'globalManufacturerCountry' : 'Страна происхождения',

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
    'taskCreatorFullName'   : 'ФИО менеджера',
    'taskOrganisationName'  : 'Организация',
    'taskSubject'           : 'Название',
    'taskCompleted'         : 'Выполнена',
    'taskCreatedOn'         : 'Дата создания',
    'taskExpiresOn'         : 'Срок выполнения',

    'organisationName'        : 'Наименование',
    'organisationFax'         : 'Факс',
    'organisationAddress'     : 'Юр. адрес',
    'organisationTID'         : 'УНП/ИНН/ИНП',
    'organisationRCBIC'       : 'БИК',
    'organisationBankAccount' : 'Рассчетный счет',
    'organisationBankName'    : 'Банк',
    'organisationBankAddress' : 'Адрес банка',

    'organisationServiceName'             : 'Наименование',
    'organisationServiceCost'             : 'Стоимость',
    'organisationServiceDefaultFacility'  : 'Оборудование по умолчанию',
    'organisationServiceDefaultComponent' : 'Компонент по умолчанию',

    'contractCustomerName'    : 'Заказчик',
    'contractContractorName'  : 'Исполнитель',
    'contractConclusionDate'  : 'Дата заключения',
    'contractExpirationDate'  : 'Дата истечения',
    'contractContinuous'      : 'Тип договора',

    'contractServiceName' : 'Наименование',
    'contractServiceCost' : 'Стоимость',
    'contractServiceObject' : 'Объект',

    'contractMaintenanceLastDate' : 'Последнее ТО',
    'contractMaintenanceNextDate' : 'Следующее ТО',
    'contractMaintenanceNextChangeDate' : 'Следующая замена',
    'contractMaintenanceObject' : 'Объект',

    'contractFacilityComponentName' : 'Наименование компонента',
    'contractFacilityComponentMaintained' : 'Обслуживается',
  }

  readonly property var placeholders: {
    'userFirstName'   : 'ИМЯ',
    'userMiddleName'  : 'ОТЧЕСТВО',
    'userLastName'    : 'ФАМИЛИЯ',
    'userFullName'    : 'ФАМИЛИЯ И.О.',

    'organisationName' : 'НАИМЕНОВАНИЕ_ОРГАНИЗАЦИИ',
    'phone'     : '+0 (00) 000-00-00',
    'country'   : 'СТРАНА А',
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
