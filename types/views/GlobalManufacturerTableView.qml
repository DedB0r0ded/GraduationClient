import QtQuick
import QtQuick.Controls
import Qt.labs.qmlmodels

import '..'
import '../models'
import '../../strings'
import '../../config'


GTableView{
  id: _root
  columnWidths: [2, 2, 1]

  model: TableModel{
    id: _model

    TableModelColumn{ display: "name" }
    TableModelColumn{ display: "country" }
    TableModelColumn{ display: "code" }

    rows: [
      {
        name: Russian.placeholders.manufacturerName,
        country: Russian.placeholders.country,
        code: Russian.placeholders.manufacturerCode,
      },
      {
        name: Russian.placeholders.manufacturerName,
        country: Russian.placeholders.country,
        code: Russian.placeholders.manufacturerCode,
      },
      {
        name: Russian.placeholders.manufacturerName,
        country: Russian.placeholders.country,
        code: Russian.placeholders.manufacturerCode,
      },
      {
        name: Russian.placeholders.manufacturerName,
        country: Russian.placeholders.country,
        code: Russian.placeholders.manufacturerCode,
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
