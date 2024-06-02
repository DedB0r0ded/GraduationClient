import QtQuick
import '../../config'

ListModel{
  id: _model

  ListElement{ text: "TEXT"; value: 0 }

  Component.onCompleted: {
    clear()
    append({"text": "Все задачи", "value": Controls.taskShowOptionAll})
    append({"text": "Мои задачи", "value": Controls.taskShowOptionSelf})
    append({"text": "Задачи других", "value": Controls.taskShowOptionAllExceptSelf})
  }
}
