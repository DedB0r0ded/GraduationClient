import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import app.frius.stateManagement

import '../types'
import '../config'
import '../strings'
import '../colorSchemes'
import '../dialogs'


GPage{
  id: _root
  groupIndex: Controls.menuProfile
  index: 0
  property bool pageLoaded: false
  property int preferredLabelWidth
  property int preferredInputWidth

  signal loggedOut()

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
    spacing: 20
    anchors{
      right: _root.right; rightMargin: 30
      left: _root.left; leftMargin: 30
      bottom: _root.bottom; bottomMargin: 30
      top: _userInfoLayout.bottom; topMargin: 40
    }

    GGroupBox{
      id: _notificationGroupBox
      title: qsTr(Russian.labels.notifications)
      Layout.fillHeight: true
      Layout.fillWidth: true


      GridLayout{
        id: _notificationLayout
        anchors.fill: parent
        rows: 4; columns: 3
        rowSpacing: 20
        columnSpacing: 40

        GLabel{
          id: _expiringContractsLabel
          text: Russian.labels.expiringContracts
          font.pointSize: FontProperties.smallTextSize
          horizontalAlignment: Text.AlignRight
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.horizontalStretchFactor: 20
        }
        GLabel{
          id: _expiringContractsQuantityLabel
          text: _root.getExpiringContractsQuantity()
          font.pointSize: FontProperties.smallTextSize
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.horizontalStretchFactor: 10
        }
        GIconButton{
          id: _expiringContractsMoreButton
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.minimumWidth: _root.calcButtonPreferredWidth()
          Layout.maximumHeight: _root.calcButtonPreferredHeight()
          Layout.horizontalStretchFactor: 3
          lightIconSource: "qrc:///images/dotsLight.png"
          darkIconSource: "qrc:///images/dotsDark.png"
        }

        GLabel{
          id: _maintenanceRequiredLabel
          text: Russian.labels.maintenanceRequired
          font.pointSize: FontProperties.smallTextSize
          horizontalAlignment: Text.AlignRight
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.horizontalStretchFactor: 20
        }
        GLabel{
          id: _maintenanceRequiredQuantityLabel
          text: _root.getMaintenanceRequiredQuantity()
          font.pointSize: FontProperties.smallTextSize
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.horizontalStretchFactor: 10
        }
        GIconButton{
          id: _maintenanceRequiredMoreButton
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.minimumWidth: _root.calcButtonPreferredWidth()
          Layout.maximumHeight: _root.calcButtonPreferredHeight()
          Layout.horizontalStretchFactor: 3
          lightIconSource: "qrc:///images/dotsLight.png"
          darkIconSource: "qrc:///images/dotsDark.png"
        }

        GLabel{
          id: _changeRequiredLabel
          text: Russian.labels.changeRequired
          font.pointSize: FontProperties.smallTextSize
          horizontalAlignment: Text.AlignRight
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.horizontalStretchFactor: 20
        }
        GLabel{
          id: _changeRequiredQuantityLabel
          text: _root.getChangeRequiredQuantity()
          font.pointSize: FontProperties.smallTextSize
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.horizontalStretchFactor: 10
        }
        GIconButton{
          id: _changeRequiredMoreButton
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.minimumWidth: _root.calcButtonPreferredWidth()
          Layout.maximumHeight: _root.calcButtonPreferredHeight()
          Layout.horizontalStretchFactor: 3
          lightIconSource: "qrc:///images/dotsLight.png"
          darkIconSource: "qrc:///images/dotsDark.png"
        }

        GLabel{
          id: _urgentMaintenanceLabel
          text: Russian.labels.urgentMaintenance
          font.pointSize: FontProperties.smallTextSize
          horizontalAlignment: Text.AlignRight
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.horizontalStretchFactor: 20
        }
        GLabel{
          id: _urgentMaintenanceQuantityLabel
          text: _root.getUrgentMaintenanceQuantity()
          font.pointSize: FontProperties.smallTextSize
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.horizontalStretchFactor: 10
        }
        GIconButton{
          id: _urgentMaintenanceMoreButton
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.minimumWidth: _root.calcButtonPreferredWidth()
          Layout.maximumHeight: _root.calcButtonPreferredHeight()
          Layout.horizontalStretchFactor: 3
          lightIconSource: "qrc:///images/dotsLight.png"
          darkIconSource: "qrc:///images/dotsDark.png"
        }
      }
    }

    GridLayout{
      id: _miscLayout

      columns: 2; rows: 6
      rowSpacing: 20

      Layout.fillHeight: true
      Layout.fillWidth: true

      GLabel{
        text: Russian.labels.colorScheme
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.horizontalStretchFactor: 3
      }
      GComboBox{
        id: _colorSchemeComboBox
        model: ListModel{
          id: _colorSchemeModel

          ListElement{
            text: "NONE"
            dark: false
          }
        }
        textRole: "text"
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.horizontalStretchFactor: 2
        onCurrentIndexChanged: if(_root.pageLoaded) _root.setColorScheme()

        Component.onCompleted: {
          if(count === 1){
            _colorSchemeModel.clear()
            _colorSchemeModel.append({"text": Russian.labels.lightColorScheme, "dark": false})
            _colorSchemeModel.append({"text": Russian.labels.darkColorScheme, "dark": true})
          }
          if(CurrentColorScheme.value.dark)
            _colorSchemeComboBox.currentIndex = find(Russian.labels.darkColorScheme)
          else
            _colorSchemeComboBox.currentIndex = find(Russian.labels.lightColorScheme)
          _root.pageLoaded = true
        }

        Component.onDestruction: {
          _root.pageLoaded = false
        }
      }

      GLabel{
        text: Russian.labels.userOrganisationQuantity
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.columnSpan: 2
      }
      GLabel{
        text: '0000'
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.columnSpan: 2
      }
      Item{
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.columnSpan: 2
        Layout.minimumHeight: _refreshDataButton.minHeight
        Layout.minimumWidth: _refreshDataButton.minWidth
        Layout.alignment: Qt.AlignRight

        GButton{
          id: _refreshDataButton
          text: Russian.buttons.profileRefreshTasks
          anchors.horizontalCenter: parent.horizontalCenter
          minWidth: _root.calcLargeButtonWidth()
          minHeight: _root.calcLargeButtonHeight()
        }
      }
      Item{
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.columnSpan: 2
        Layout.minimumHeight: _clearCompletedButton.minHeight
        Layout.minimumWidth: _clearCompletedButton.minWidth
        Layout.alignment: Qt.AlignRight

        GButton{
          id: _clearCompletedButton
          anchors.horizontalCenter: parent.horizontalCenter
          text: Russian.buttons.profileClearCompletedTasks
          minWidth: _root.calcLargeButtonWidth()
          minHeight: _root.calcLargeButtonHeight()
        }
      }
      Item{
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.columnSpan: 2
        Layout.minimumHeight: _logOutButton.minHeight
        Layout.minimumWidth: _logOutButton.minWidth
        Layout.alignment: Qt.AlignRight

        GButton{
          id: _logOutButton
          anchors.horizontalCenter: parent.horizontalCenter
          text: Russian.buttons.profileSignOut
          minWidth: _root.calcLargeButtonWidth()
          minHeight: _root.calcLargeButtonHeight()
          dangerous: true
          onClicked: _root.loggedOut()
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

  function calcLargeButtonWidth(){
    let b = _bottomLayout
    let m = _miscLayout
    let res = (_root.width - b.anchors.rightMargin -
               b.anchors.leftMargin - m.columnSpacing) / 2
    return res
  }

  function calcLargeButtonHeight(){
    return WindowSizes.stdHeight / Controls.largeButtonsHeightRatio
  }

  function calcPreferredWidth(){
    let res = WindowSizes.stdWidth / Controls.basicInputWidthRatio
    return res
  }

  function getExpiringContractsQuantity(){
    // C++ REST
    return 0
  }

  function getMaintenanceRequiredQuantity(){
    // C++ REST
    return 0
  }

  function getChangeRequiredQuantity(){
    // C++ REST
    return 0
  }

  function getUrgentMaintenanceQuantity(){
    // C++ REST
    return 0
  }

  function assertDrawnCorrectly(){
    if(_emailLabel.width !== _root.preferredInputWidth)
      _root.drawnIncorrectly()
  }

  function setColorScheme(){
    if(_colorSchemeComboBox.currentText === Russian.labels.lightColorScheme)
      CurrentColorScheme.value = BlueDark
    else
      CurrentColorScheme.value = BlueLight
  }

  Component.onCompleted: {
    _root.preferredInputWidth = _root.calcPreferredWidth()
    assertDrawnCorrectly()

  }
}
