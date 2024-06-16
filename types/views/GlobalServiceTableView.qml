import QtQuick
import QtQuick.Controls
import Qt.labs.qmlmodels

import '..'
import '../models'
import '../../strings'
import '../../config'


GTableView{
  id: _root
  columnWidths: [1, 1, 1]

  model: TableModel{
    id: _model

    TableModelColumn{ display: "name" }
    TableModelColumn{ display: "defaultFacilityName" }
    TableModelColumn{ display: "defaultComponentName" }

    rows: [
      {
        name: Russian.placeholders.serviceName,
        defaultFacilityName: Russian.placeholders.facilityName,
        defaultComponentName: Russian.placeholders.componentName,
      },
      {
        name: Russian.placeholders.serviceName,
        defaultFacilityName: Russian.placeholders.facilityName,
        defaultComponentName: Russian.placeholders.componentName,
      },
      {
        name: Russian.placeholders.serviceName,
        defaultFacilityName: Russian.placeholders.facilityName,
        defaultComponentName: Russian.placeholders.componentName,
      },
      {
        name: Russian.placeholders.serviceName,
        defaultFacilityName: Russian.placeholders.facilityName,
        defaultComponentName: Russian.placeholders.componentName,
      },
      {
        name: Russian.placeholders.serviceName,
        defaultFacilityName: Russian.placeholders.facilityName,
        defaultComponentName: Russian.placeholders.componentName,
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
