import QtQuick
import QtQuick.Controls
import Qt.labs.qmlmodels

import '..'
import '../models'
import '../../strings'
import '../../config'

GTableView{
  id: _root
  columnWidths: [2, 1, 2]

  model: TableModel{
    id: _model

    TableModelColumn{ display: "name" }
    TableModelColumn{ display: "cost" }
    TableModelColumn{ display: "object" }

    rows: [
      {
        name: Russian.placeholders.serviceName,
        cost: 99999,
        object: Russian.placeholders.facilityName,
      },
      {
        name: Russian.placeholders.serviceName,
        cost: 99999,
        object: Russian.placeholders.facilityName,
      },
      {
        name: Russian.placeholders.serviceName,
        cost: 99999,
        object: Russian.placeholders.facilityName,
      },
      {
        name: Russian.placeholders.serviceName,
        cost: 99999,
        object: Russian.placeholders.facilityName,
      },
      {
        name: Russian.placeholders.serviceName,
        cost: 99999,
        object: Russian.placeholders.facilityName,
      },
      {
        name: Russian.placeholders.serviceName,
        cost: 99999,
        object: Russian.placeholders.facilityName,
      },
      {
        name: Russian.placeholders.serviceName,
        cost: 99999,
        object: Russian.placeholders.facilityName,
      },
      {
        name: Russian.placeholders.serviceName,
        cost: 99999,
        object: Russian.placeholders.facilityName,
      },
    ]
  }

  delegate: GTableLabel{ text: model.display }

  Component.onCompleted: { }
}
