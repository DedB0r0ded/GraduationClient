import QtQuick
import QtQuick.Controls
import Qt.labs.qmlmodels

import '..'
import '../models'
import '../../strings'
import '../../config'

GTableView{
  id: _root
  columnWidths: [7, 1]

  model: TableModel{
    id: _model

    TableModelColumn{ display: "name" }
    TableModelColumn{ display: "granted" }

    rows: [
      {
        name: Russian.placeholders.privilegeName,
        granted: false,
      },
      {
        name: Russian.placeholders.privilegeName,
        granted: false,
      },
      {
        name: Russian.placeholders.privilegeName,
        granted: false,
      },
      {
        name: Russian.placeholders.privilegeName,
        granted: false,
      },
      {
        name: Russian.placeholders.privilegeName,
        granted: false,
      },
    ]
  }

  delegate: DelegateChooser{

    DelegateChoice{
      column: 1
      delegate: GTableLabel{
        text: ""
        CheckBox{
          id: _checkBox
          property bool current: parent.current
          property bool selected: parent.selected
          anchors{
            centerIn: parent
          }
          checked: model.display
          onToggled: {
            model.display = checked
          }
        }
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
