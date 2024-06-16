import QtQuick
import QtQuick.Controls
import Qt.labs.qmlmodels

import '..'
import '../models'
import '../../strings'
import '../../config'

GTableView{
  id: _root
  columnWidths: [2, 2, 2, 3]

  model: TableModel{
    id: _model

    TableModelColumn{ display: "lastMaintenance" }
    TableModelColumn{ display: "nextMaintenance" }
    TableModelColumn{ display: "nextChange" }
    TableModelColumn{ display: "object" }

    rows: [
      {
        lastMaintenance: Russian.placeholders.date,
        nextMaintenance: Russian.placeholders.date,
        nextChange: Russian.placeholders.date,
        object: Russian.placeholders.facilityName,
      },

      {
        lastMaintenance: Russian.placeholders.date,
        nextMaintenance: Russian.placeholders.date,
        nextChange: Russian.placeholders.date,
        object: Russian.placeholders.facilityName,
      },

      {
        lastMaintenance: Russian.placeholders.date,
        nextMaintenance: Russian.placeholders.date,
        nextChange: Russian.placeholders.date,
        object: Russian.placeholders.facilityName,
      },

      {
        lastMaintenance: Russian.placeholders.date,
        nextMaintenance: Russian.placeholders.date,
        nextChange: Russian.placeholders.date,
        object: Russian.placeholders.facilityName,
      },

      {
        lastMaintenance: Russian.placeholders.date,
        nextMaintenance: Russian.placeholders.date,
        nextChange: Russian.placeholders.date,
        object: Russian.placeholders.facilityName,
      },

      {
        lastMaintenance: Russian.placeholders.date,
        nextMaintenance: Russian.placeholders.date,
        nextChange: Russian.placeholders.date,
        object: Russian.placeholders.facilityName,
      },
    ]
  }

  delegate: GTableLabel{ text: model.display }

  Component.onCompleted: {  }
}
