import QtQuick
import QtQuick.Controls
import Qt.labs.qmlmodels

import '..'
import '../models'
import '../../strings'
import '../../config'


GTableView{
  id: _root
  columnWidths: [3, 4, 4, 3, 2]

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
      },
      {
        creatorFullName: Russian.placeholders.userFullName,
        organisationName: Russian.placeholders.organisationName,
        subject: Russian.placeholders.shortText,
        expiresOn: Russian.placeholders.date,
        completed: false,
      },
      {
        creatorFullName: Russian.placeholders.userFullName,
        organisationName: Russian.placeholders.organisationName,
        subject: Russian.placeholders.shortText,
        expiresOn: Russian.placeholders.date,
        completed: false,
      },
      {
        creatorFullName: Russian.placeholders.userFullName,
        organisationName: Russian.placeholders.organisationName,
        subject: Russian.placeholders.shortText,
        expiresOn: Russian.placeholders.date,
        completed: false,
      },
      {
        creatorFullName: Russian.placeholders.userFullName,
        organisationName: Russian.placeholders.organisationName,
        subject: Russian.placeholders.shortText,
        expiresOn: Russian.placeholders.date,
        completed: false,
      },
    ]

    function fetchModel(){
      //clear()
      // C++ REST
      return 0
    }
  }

  delegate: DelegateChooser{

    DelegateChoice{
      column: 4
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
          enabled: false

        }
      }
    }
    DelegateChoice{
      delegate: GTableLabel{
        text: model.display
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
