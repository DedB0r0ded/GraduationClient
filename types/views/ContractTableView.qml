import QtQuick
import QtQuick.Controls
import Qt.labs.qmlmodels

import '..'
import '../models'
import '../../strings'
import '../../config'


GTableView{
  id: _root
  columnWidths: [3, 3, 1, 1]

  model: TableModel{
    id: _model

    TableModelColumn{ display: "customerName" }
    TableModelColumn{ display: "contractorName" }
    TableModelColumn{ display: "conclusionDate" }
    TableModelColumn{ display: "continuous" }

    rows: [
      {
        customerName: Russian.placeholders.organisationName,
        contractorName: Russian.placeholders.organisationName,
        conclusionDate: Russian.placeholders.date,
        continuous: false,
      },
      {
        customerName: Russian.placeholders.organisationName,
        contractorName: Russian.placeholders.organisationName,
        conclusionDate: Russian.placeholders.date,
        continuous: false,
      },
      {
        customerName: Russian.placeholders.organisationName,
        contractorName: Russian.placeholders.organisationName,
        conclusionDate: Russian.placeholders.date,
        continuous: false,
      },
      {
        customerName: Russian.placeholders.organisationName,
        contractorName: Russian.placeholders.organisationName,
        conclusionDate: Russian.placeholders.date,
        continuous: false,
      },
    ]

    function fetchModel(){
      // clear()
      // C++ REST
      return 0
    }
  }

  delegate: DelegateChooser{

    DelegateChoice{
      column: 3
      delegate: GTableLabel{
        text: model.display ? Russian.labels.contractTypeContinuous : Russian.labels.contractTypeService
      }
    }
    DelegateChoice{
      delegate: GTableLabel{
        text: model.display
      }
    }
  }


  Component.onCompleted: {  }
}
