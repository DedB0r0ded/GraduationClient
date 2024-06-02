import QtQuick
import QtQuick.Controls
import Qt.labs.qmlmodels

import '..'
import '../models'
import '../../strings'
import '../../config'


TableView{
  id: _root
  property var columnWidths: [1, 1, 1]

  columnSpacing: 1; rowSpacing: 10
  columnWidthProvider: function(column) {
    return width * (columnWidths[column] / columnWidths.reduce(sum, 0)) - columnSpacing
  }
  rowHeightProvider: (row) => {return 60}

  interactive: false
  boundsBehavior: TableView.StopAtBounds
  resizableColumns: false; resizableRows: false

  selectionBehavior: TableView.SelectRows
  selectionMode: TableView.ContiguousSelection
  selectionModel: ItemSelectionModel{
    id: _smodel
    onCurrentChanged: ()=>{
      let id = currentIndex
      _smodel.select(currentIndex, ItemSelectionModel.Rows | ItemSelectionModel.Select)
    }
  }

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


  Component.onCompleted: {
  }

  function sum(acc, item, index, arr){
    acc += item
    return acc
  }
}
