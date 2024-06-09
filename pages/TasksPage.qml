import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import com.frius.states

import '../types'
import '../types/models'
import '../types/basic'
import '../types/views'
import '../strings'
import '../config'

GPage{
  id: _root
  groupIndex: Controls.menuTasks
  index: 0

  ColumnLayout{
    id: _pageLayout
    anchors{
      fill: parent
      centerIn: parent
      margins: 20
    }
    spacing: 20


    RowLayout{
      id: _userFullNameLayout
      Layout.fillHeight: true
      Layout.fillWidth: true
      Layout.verticalStretchFactor: 4
      spacing: 20

      GLabel{
        id: _firstNameLabel
        text: Russian.placeholders.userFirstName
        Layout.fillHeight: true
        Layout.fillWidth: true
      }
      GLabel{
        id: _middleNameLabel
        text: Russian.placeholders.userMiddleName
        Layout.fillHeight: true
        Layout.fillWidth: true
      }
      GLabel{
        id: _lastNameLabel
        text: Russian.placeholders.userLastName
        Layout.fillHeight: true
        Layout.fillWidth: true
      }
    }

    RowLayout{
      id: _taskSortLayout
      Layout.fillHeight: true
      Layout.fillWidth: true
      Layout.verticalStretchFactor: 4
      spacing: 20

      GLabel{
        id: _taskShowOptionLabel
        text: Russian.labels.taskShowOption
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.horizontalStretchFactor: 3
      }
      GComboBox{
        id: _taskShowOptionComboBox
        model: TaskShowOptionComboBoxListModel{}
        font.pointSize: FontProperties.smallTextSize
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.horizontalStretchFactor: 2
      }

      GLabel{
        id: _taskSortOptionLabel
        text: Russian.labels.taskSortOption
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.horizontalStretchFactor: 3
      }
      GComboBox{
        id: _taskSortOptionComboBox
        model: TaskSortOptionComboBoxListModel{}
        font.pointSize: FontProperties.smallTextSize
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.horizontalStretchFactor: 2
      }
    }
    RowLayout{
      id: _taskTableLayout
      Layout.fillHeight: true
      Layout.fillWidth: true
      Layout.verticalStretchFactor: 64
      spacing: 20

      GCanvas{
        color: CurrentColorScheme.value.input.background.idle
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.horizontalStretchFactor: 16
        anchors{
          fill: undefined
          centerIn: undefined
        }
        HorizontalHeaderView{
          id: _hHeaderView
          anchors{
            left: parent.left
            right: parent.right
            top: parent.top
          }
          rowHeightProvider: column => {return 80}
          syncView: _taskTableView
          model: [
            Russian.tableHeaders.taskCreatorFullName,
            Russian.tableHeaders.taskOrganisationName,
            Russian.tableHeaders.taskSubject,
            Russian.tableHeaders.taskExpiresOn,
            Russian.tableHeaders.taskCompleted
          ]
          delegate: GLabel{
            text: modelData
            font.pointSize: FontProperties.plainTextSize
          }
        }
        TaskTableView{
          id: _taskTableView
          anchors{
            left: parent.left
            right: parent.right
            top: _hHeaderView.bottom
            topMargin: rowSpacing
            bottom: parent.bottom
          }
        }
      }

      Column{
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.horizontalStretchFactor: 1
        spacing: 20
        GIconButton{
          id: _taskTableAddButton
          width: _root.calcButtonPreferredWidth(); height: width
          lightIconSource: "qrc:///images/plusLight.png"
          darkIconSource: "qrc:///images/plusDark.png"
          //onClicked:
        }
        GIconButton{
          id: _taskTableCompleteButton
          width: _root.calcButtonPreferredWidth(); height: width
          lightIconSource: "qrc:///images/blackTickLight.png"
          darkIconSource: "qrc:///images/blackTickDark.png"
          //onClicked:
        }
        GIconButton{
          id: _taskTableEditButton
          width: _root.calcButtonPreferredWidth(); height: width
          lightIconSource: "qrc:///images/pencilLight.png"
          darkIconSource: "qrc:///images/pencilDark.png"
          //onClicked:
        }
        GIconButton{
          id: _taskTableDeleteButton
          width: _root.calcButtonPreferredWidth(); height: width
          lightIconSource: "qrc:///images/minusLight.png"
          darkIconSource: "qrc:///images/minusDark.png"
          //onClicked:
        }
      }
    }
  }


  function calcButtonPreferredWidth(){
    return WindowSizes.stdWidth / Controls.smallButtonsWidthRatio
  }

  function calcButtonPreferredHeight(){
    return WindowSizes.stdHeight / Controls.smallButtonsHeightRatio
  }
}
