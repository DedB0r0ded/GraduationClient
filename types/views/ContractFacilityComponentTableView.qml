import QtQuick
import QtQuick.Controls
import Qt.labs.qmlmodels

import '..'
import '../models'
import '../../strings'
import '../../config'


GTableView{
  id: _root
  columnWidths: [3, 1]

  model: TableModel{
    id: _model

    TableModelColumn{ display: "name" }
    TableModelColumn{ display: "maintained" }

    rows: [
      {
        name: Russian.placeholders.componentName,
        maintained: false,
      },
      {
        name: Russian.placeholders.componentName,
        maintained: false,
      },
      {
        name: Russian.placeholders.componentName,
        maintained: false,
      },
      {
        name: Russian.placeholders.componentName,
        maintained: false,
      },
      {
        name: Russian.placeholders.componentName,
        maintained: false,
      },
      {
        name: Russian.placeholders.componentName,
        maintained: false,
      },
      {
        name: Russian.placeholders.componentName,
        maintained: false,
      },
      {
        name: Russian.placeholders.componentName,
        maintained: false,
      },
      {
        name: Russian.placeholders.componentName,
        maintained: false,
      },
      {
        name: Russian.placeholders.componentName,
        maintained: false,
      },
      {
        name: Russian.placeholders.componentName,
        maintained: false,
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
