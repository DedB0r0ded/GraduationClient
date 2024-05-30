import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import '../types'
import '../config'
import '../strings'


GPage{
  id: _root
  groupIndex: Controls.menuProfile
  index: 0
  property int preferredLabelWidth
  property int preferredInputWidth

  GridLayout{
    id: _userInfoLayout
    anchors{
      right: parent.right; rightMargin: 30
      left: parent.left; leftMargin: 30
      top: parent.top; topMargin: 30

    }

    height: parent.height / Controls.profileInfoLayoutHeightRatio

    rows: 4; columns: 2
    rowSpacing: 20
    columnSpacing: 80

    GLabel{
      id: _lastNameLabel
      text: Russian.labels.lastName;
      Layout.fillWidth: true
      Layout.fillHeight: true
      Layout.preferredWidth: _root.preferredInputWidth
      Layout.maximumWidth: _root.preferredInputWidth
    }
    GTextField{
      id: _lastNameInput
      //text: Russian.labels.lastName;
      Layout.fillWidth: true
      Layout.fillHeight: true
      Layout.preferredWidth: _root.preferredInputWidth
      Layout.maximumWidth: _root.preferredInputWidth
    }

    GLabel{
      id: _firstNameLabel
      text: Russian.labels.firstName;
      Layout.fillWidth: true
      Layout.fillHeight: true
      Layout.preferredWidth: _root.preferredInputWidth
      Layout.maximumWidth: _root.preferredInputWidth
    }
    GTextField{
      id: _firstNameInput
      //text: Russian.labels.firstName;
      Layout.fillWidth: true
      Layout.fillHeight: true
      Layout.preferredWidth: _root.preferredInputWidth
      Layout.maximumWidth: _root.preferredInputWidth
    }

    GLabel{
      id: _middleNameLabel
      text: Russian.labels.middleName;
      Layout.fillWidth: true
      Layout.fillHeight: true
      Layout.preferredWidth: _root.preferredInputWidth
      Layout.maximumWidth: _root.preferredInputWidth
    }
    GTextField{
      id: _middleNameInput
      //text: Russian.labels.middleName;
      Layout.fillWidth: true
      Layout.fillHeight: true
      Layout.preferredWidth: _root.preferredInputWidth
      Layout.maximumWidth: _root.preferredInputWidth
    }

    GLabel{
      id: _emailLabel
      text: Russian.labels.email;
      Layout.fillWidth: true
      Layout.fillHeight: true
      Layout.preferredWidth: _root.preferredInputWidth
      Layout.maximumWidth: _root.preferredInputWidth
    }
    GTextField{
      id: _emailInput
      //text: Russian.labels.email;
      Layout.fillWidth: true
      Layout.fillHeight: true
      Layout.preferredWidth: _root.preferredInputWidth
      Layout.maximumWidth: _root.preferredInputWidth
    }
  }

  RowLayout{
    id: _bottomLayout
    anchors{
      right: parent.right; rightMargin: 30
      left: parent.left; leftMargin: 30
      bottom: parent.bottom; bottomMargin: 30
      top: _userInfoLayout.bottom; topMargin: 40
    }

    GGroupBox{
      id: _notificationGroupBox
      title: qsTr(Russian.labels.notifications)


      GridLayout{
        id: _notificationLayout
        rows: 4; columns: 3
        rowSpacing: 20
        columnSpacing: 10

        GLabel{
          id: _expiringContractsLabel
          text: Russian.labels.expiringContracts
          horizontalAlignment: Text.AlignRight
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.horizontalStretchFactor: 20
        }
        GLabel{
          id: _expiringContractsQuantityLabel
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.horizontalStretchFactor: 10
        }
        GIconButton{
          id: _expiringContractsMoreButton
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.minimumWidth: _root.calcButtonPreferredWidth()
          Layout.minimumHeight: _root.calcButtonPreferredHeight()
          Layout.horizontalStretchFactor: 3
          lightIconSource: "qrc:///images/dotsLight.png"
          darkIconSource: "qrc:///images/dotsDark.png"
        }

        GLabel{
          id: _maintenanceRequiredLabel
          text: Russian.labels.maintenanceRequired
          horizontalAlignment: Text.AlignRight
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.horizontalStretchFactor: 20
        }
        GLabel{
          id: _maintenanceRequiredQuantityLabel
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.horizontalStretchFactor: 10
        }
        GIconButton{
          id: _maintenanceRequiredMoreButton
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.minimumWidth: _root.calcButtonPreferredWidth()
          Layout.minimumHeight: _root.calcButtonPreferredHeight()
          Layout.horizontalStretchFactor: 3
          lightIconSource: "qrc:///images/dotsLight.png"
          darkIconSource: "qrc:///images/dotsDark.png"
        }

        GLabel{
          id: _changeRequiredLabel
          text: Russian.labels.changeRequired
          horizontalAlignment: Text.AlignRight
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.horizontalStretchFactor: 20
        }
        GLabel{
          id: _changeRequiredQuantityLabel
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.horizontalStretchFactor: 10
        }
        GIconButton{
          id: _changeRequiredMoreButton
          Layout.fillWidth: true
          Layout.fillHeight: false
          Layout.minimumWidth: _root.calcButtonPreferredWidth()
          Layout.minimumHeight: _root.calcButtonPreferredHeight()
          Layout.horizontalStretchFactor: 3
          lightIconSource: "qrc:///images/dotsLight.png"
          darkIconSource: "qrc:///images/dotsDark.png"
        }

        GLabel{
          id: _urgentMaintenanceLabel
          text: Russian.labels.urgentMaintenance
          horizontalAlignment: Text.AlignRight
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.horizontalStretchFactor: 20
        }
        GLabel{
          id: _urgentMaintenanceQuantityLabel
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.horizontalStretchFactor: 10
        }
        GIconButton{
          id: _urgentMaintenanceMoreButton
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.minimumWidth: _root.calcButtonPreferredWidth()
          Layout.minimumHeight: _root.calcButtonPreferredHeight()
          Layout.horizontalStretchFactor: 3
          lightIconSource: "qrc:///images/dotsLight.png"
          darkIconSource: "qrc:///images/dotsDark.png"
        }
      }
    }

    GridLayout{
      id: _miscLayout

      columns: 2;
      GLabel{}
      GComboBox{
        Layout.fillWidth: true
        Layout.fillHeight: true
      }
      GLabel{}
      GLabel{}
      GLabel{}
      GLabel{}
      GButton{}

    }
  }

  function calcButtonPreferredWidth(){
    return WindowSizes.stdWidth / Controls.smallButtonsWidthRatio
  }

  function calcButtonPreferredHeight(){
    return WindowSizes.stdHeight / Controls.smallButtonsHeightRatio
  }

  function calcPreferredWidth(){
    let res = WindowSizes.stdWidth / Controls.basicInputWidthRatio
    return res
  }

  function assertDrawnCorrectly(){
    if(_emailLabel.width !== _root.preferredInputWidth)
      _root.drawnIncorrectly()
  }

  Component.onCompleted: {
    _root.preferredInputWidth = _root.calcPreferredWidth()
    assertDrawnCorrectly()
  }
}
