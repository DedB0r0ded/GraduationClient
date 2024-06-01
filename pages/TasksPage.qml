import QtQuick
import QtQuick.Layouts
import '../types'
import '../config'
import '../types/models/comboBox'

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


    GridLayout{
      id: _topLayout
      Layout.fillHeight: true
      Layout.fillWidth: true
      Layout.verticalStretchFactor: 9
      rows: 2
      columns: 12

      GLabel{
        id: _firstNameLabel
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.row: 0
        Layout.column: 0
        Layout.columnSpan: 4
      }
      GLabel{
        id: _middleNameLabel
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.row: 0
        Layout.column: 4
        Layout.columnSpan: 4
      }
      GLabel{
        id: _lastNameLabel
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.row: 0
        Layout.column: 8
        Layout.columnSpan: 4
      }

      GLabel{
        id: _taskShowOptionLabel
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.row: 1
        Layout.column: 0
        Layout.columnSpan: 3
        Layout.horizontalStretchFactor: 6
      }
      GComboBox{
        id: _taskShowOptionComboBox
        model: TaskShowOptionComboBoxListModel{}
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.row: 1
        Layout.column: 3
        Layout.columnSpan: 3
        Layout.horizontalStretchFactor: 9
      }

      GLabel{
        id: _taskSortOptionLabel
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.row: 1
        Layout.column: 6
        Layout.columnSpan: 3
        Layout.horizontalStretchFactor: 10
      }
      GComboBox{
        id: _taskSortOptionComboBox
        model: TaskSortOptionComboBoxListModel{}
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.row: 1
        Layout.column: 9
        Layout.columnSpan: 3
        Layout.horizontalStretchFactor: 7
      }
    }
    RowLayout{
      id: _taskTableLayout
      Layout.fillHeight: true
      Layout.fillWidth: true
      Layout.verticalStretchFactor: 64
    }
  }



}
