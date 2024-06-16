import QtQuick
import QtQuick.Controls
import Qt.labs.qmlmodels

import '..'
import '../models'
import '../../strings'
import '../../config'

GTableView{
  id: _root
  columnWidths: [1]

  model: TableModel{
    id: _model

    TableModelColumn{ display: "name" }

    rows: [
      { name: Russian.placeholders.componentName },
      { name: Russian.placeholders.componentName },
      { name: Russian.placeholders.componentName },
      { name: Russian.placeholders.componentName },
      { name: Russian.placeholders.componentName },
      { name: Russian.placeholders.componentName },
      { name: Russian.placeholders.componentName },
      { name: Russian.placeholders.componentName },

    ]
  }

  delegate: GTableLabel{ text: model.display }

  Component.onCompleted: {  }
}
