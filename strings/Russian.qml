pragma Singleton

import QtQuick

QtObject{
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
    'firstName' : 'Имя',
    'middleName': 'Отчество',
    'lastName'  : 'Фамилия',
    'email'     : 'Электронная почта'
  }

  readonly property var placeholders: {
    'firstName' : ''
  }
}
