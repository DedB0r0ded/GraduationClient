import QtQuick
import QtQuick.Controls
import Qt.labs.qmlmodels

import '..'
import '../models'
import '../../strings'
import '../../config'


GTableView{
  id: _root
  columnWidths: [4, 3]

  model: TableModel{
    id: _model

    TableModelColumn{ display: "user" }
    TableModelColumn{ display: "keyValue" }

    rows: [
      {
        user: Russian.placeholders.userFullName,
        keyValue: Russian.placeholders.regKeyShortValue,
      },
      {
        user: Russian.placeholders.userFullName,
        keyValue: Russian.placeholders.regKeyShortValue,
      },
      {
        user: Russian.placeholders.userFullName,
        keyValue: Russian.placeholders.regKeyShortValue,
      },
      {
        user: Russian.placeholders.userFullName,
        keyValue: Russian.placeholders.regKeyShortValue,
      },
      {
        user: Russian.placeholders.userFullName,
        keyValue: Russian.placeholders.regKeyShortValue,
      },
    ]

    function fetchModel(){
      // clear()
      // C++ REST
      return 0
    }
  }

  delegate: GTableLabel{ text: model.display }

  Component.onCompleted: {  }
}
