import QtQuick
import QtQuick.Controls
import Qt.labs.qmlmodels

import '..'
import '../models'
import '../../strings'
import '../../config'

GTableView{
  id: _root
  columnWidths: [3, 3, 2, 2]

  model: TableModel{
    id: _model

    TableModelColumn{ display: "name" }
    TableModelColumn{ display: "manufacturer" }
    TableModelColumn{ display: "manufactureYear" }
    TableModelColumn{ display: "warrantyPeriod" }

    rows: [
      {
        name: Russian.placeholders.componentName,
        manufacturer: Russian.placeholders.manufactureYear,
        manufactureYear: Russian.placeholders.manufactureYear,
        warrantyPeriod: Russian.placeholders.warrantyPeriod,
      },
      {
        name: Russian.placeholders.componentName,
        manufacturer: Russian.placeholders.manufactureYear,
        manufactureYear: Russian.placeholders.manufactureYear,
        warrantyPeriod: Russian.placeholders.warrantyPeriod,
      },
      {
        name: Russian.placeholders.componentName,
        manufacturer: Russian.placeholders.manufactureYear,
        manufactureYear: Russian.placeholders.manufactureYear,
        warrantyPeriod: Russian.placeholders.warrantyPeriod,
      },
      {
        name: Russian.placeholders.componentName,
        manufacturer: Russian.placeholders.manufactureYear,
        manufactureYear: Russian.placeholders.manufactureYear,
        warrantyPeriod: Russian.placeholders.warrantyPeriod,
      },
      {
        name: Russian.placeholders.componentName,
        manufacturer: Russian.placeholders.manufactureYear,
        manufactureYear: Russian.placeholders.manufactureYear,
        warrantyPeriod: Russian.placeholders.warrantyPeriod,
      },
    ]
  }

  delegate: GTableLabel{ text: model.display }

  Component.onCompleted: {  }
}
