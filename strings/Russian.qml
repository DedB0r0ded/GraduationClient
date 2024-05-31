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
    'globalManufacturerName'        : 'Наименование',
    'globalManufacturerCode'        : 'Код',
    'globalServiceName'             : 'Наименование',
    'globalServiceDefaultFacility'  : 'Оборудование по умолчанию',
    'globalServiceDefaultComponent' : 'Компонент по умолчанию'
  }

  readonly property var placeholders: {
    'firstName' : ''
  }
}
