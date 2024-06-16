import QtQuick
import QtQuick.Controls
import Qt.labs.qmlmodels

import '..'
import '../models'
import '../../strings'
import '../../config'

GTableView{
  id: _root
  columnWidths: [4, 3, 4, 3]

  model: TableModel{
    id: _model

    TableModelColumn{ display: "name" }
    TableModelColumn{ display: "fax" }
    TableModelColumn{ display: "address" }
    TableModelColumn{ display: "tid" }

    rows: [
      {
        name: Russian.placeholders.organisationName,
        fax: Russian.placeholders.phone,
        address: Russian.placeholders.address,
        tid: Russian.placeholders.tid,
      },
      {
        name: Russian.placeholders.organisationName,
        fax: Russian.placeholders.phone,
        address: Russian.placeholders.address,
        tid: Russian.placeholders.tid,
      },
      {
        name: Russian.placeholders.organisationName,
        fax: Russian.placeholders.phone,
        address: Russian.placeholders.address,
        tid: Russian.placeholders.tid,
      },
      {
        name: Russian.placeholders.organisationName,
        fax: Russian.placeholders.phone,
        address: Russian.placeholders.address,
        tid: Russian.placeholders.tid,
      },
      {
        name: Russian.placeholders.organisationName,
        fax: Russian.placeholders.phone,
        address: Russian.placeholders.address,
        tid: Russian.placeholders.tid,
      },
    ]
  }

  delegate: GTableLabel{ text: model.display }

  Component.onCompleted: { }
}
