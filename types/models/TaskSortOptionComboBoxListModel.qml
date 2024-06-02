import QtQuick
import '../../config'

ListModel{
  id: _model

  ListElement{ text: "TEXT"; value: 0 }

  Component.onCompleted: {
    clear()
    append({"text": "Менеджеру", "value": Controls.taskSortOptionByCreatorFullName})
    append({"text": "Дате создания", "value": Controls.taskSortOptionByCreationDate})
    append({"text": "Сроку выполнения", "value": Controls.taskSortOptionByExpirationDate})
  }
}
