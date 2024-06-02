import QtQuick
import QtQuick.Controls
import Qt.labs.qmlmodels

import '..'
import '../models'
import '../../strings'
import '../../config'


TableView{
  id: _root
  property var columnWidths: [3, 4, 4, 3, 2]

  columnSpacing: 1; rowSpacing: 10
  columnWidthProvider: function(column) {
    return width * (columnWidths[column] / columnWidths.reduce(sum, 0)) - columnSpacing
  }
  rowHeightProvider: (row) => {return 60}

  interactive: true
  boundsBehavior: TableView.StopAtBounds
  resizableColumns: false; resizableRows: false

  selectionBehavior: TableView.SelectRows
  //selectionMode: TableView.SingleSelection
  selectionModel: ItemSelectionModel{}

  model: TableModel{
    id: _model

    TableModelColumn{ display: "creatorFullName" }
    TableModelColumn{ display: "organisationName" }
    TableModelColumn{ display: "subject" }
    TableModelColumn{ display: "expiresOn" }
    TableModelColumn{ display: "completed" }

    rows: [
      {
        creatorFullName: Russian.placeholders.userFullName,
        organisationName: Russian.placeholders.organisationName,
        subject: Russian.placeholders.shortText,
        expiresOn: Russian.placeholders.date,
        completed: false,
      }
    ]

    function fetchModel(){
      // clear()
      // C++ REST
      return 0
    }
  }

  delegate: DelegateChooser{
    DelegateChoice{
      column: 0
      delegate: GTableLabel{
        text: model.display
      }
    }
    DelegateChoice{
      column: 1
      delegate: GTableLabel{
        text: model.display
      }
    }
    DelegateChoice{
      column: 2
      delegate: GTableLabel{
        text: model.display
      }
    }
    DelegateChoice{
      column: 3
      delegate: GTableLabel{
        text: model.display
      }
    }
    DelegateChoice{
      column: 4
      delegate: GTableLabel{
        text: ""
        CheckBox{
          id: _checkBox
          property bool current: parent.current
          property bool selected: parent.selected
          anchors{
            fill: parent
            centerIn: parent
          }
          checked: model.display
          nextCheckState: function() {
            if(checked)
              return Qt.Checked
            return Qt.Unchecked
          }
        }
      }
    }
  }


  Component.onCompleted: {
  }

  function sum(acc, item, index, arr){
    acc += item
    return acc
  }
}
