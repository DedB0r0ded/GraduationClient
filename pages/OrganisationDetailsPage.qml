import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import app.frius.stateManagement

import '../types'
import '../types/models'
import '../types/basic'
import '../types/views'
import '../strings'
import '../config'

GPage{
  id: _root
  groupIndex: Controls.menuOrganisations
  index: Controls.organisationDetailsPage

  // TODO: refactor `pageCalled` signal
  signal pageCalled(int index)

  ColumnLayout{
    id: _pageLayout
    anchors{
      fill: parent
      centerIn: parent
      margins: 20
    }
    spacing: 20

    GridLayout{
      id: _infoLayout
      Layout.fillHeight: true
      Layout.fillWidth: true
      Layout.verticalStretchFactor: 1

      columns: 2; columnSpacing: 40
      rowSpacing: 5

      GLabel{
        id: _nameLabel
        text: Russian.labels.organisationName
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.preferredWidth: _root.calcInputPreferredWidth()
      }
      GTextField{
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.preferredWidth: _root.calcInputPreferredWidth()
      }

      GLabel{
        id: _addressLabel
        text: Russian.labels.organisationAddress
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.preferredWidth: _root.calcInputPreferredWidth()
      }
      GTextField{
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.preferredWidth: _root.calcInputPreferredWidth()
      }

      GLabel{
        id: _faxLabel
        text: Russian.labels.organisationFax
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.preferredWidth: _root.calcInputPreferredWidth()
      }
      GTextField{
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.preferredWidth: _root.calcInputPreferredWidth()
      }

      GLabel{
        id: _TIDLabel
        text: Russian.labels.organisationTID
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.preferredWidth: _root.calcInputPreferredWidth()
      }
      GTextField{
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.preferredWidth: _root.calcInputPreferredWidth()
      }

      GLabel{
        id: _bankAccountLabel
        text: Russian.labels.organisationBankAccount
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.preferredWidth: _root.calcInputPreferredWidth()
      }
      GTextField{
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.preferredWidth: _root.calcInputPreferredWidth()
      }

      GLabel{
        id: _rcbicLabel
        text: Russian.labels.organisationRCBIC
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.preferredWidth: _root.calcInputPreferredWidth()
      }
      GTextField{
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.preferredWidth: _root.calcInputPreferredWidth()
      }

      GLabel{
        id: _bankNameLabel
        text: Russian.labels.organisationBankName
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.preferredWidth: _root.calcInputPreferredWidth()
      }
      GTextField{
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.preferredWidth: _root.calcInputPreferredWidth()
      }

      GLabel{
        id: _bankAddressLabel
        text: Russian.labels.organisationBankAddress
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.preferredWidth: _root.calcInputPreferredWidth()
      }
      GTextField{
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.preferredWidth: _root.calcInputPreferredWidth()
      }
    }

    Item{
      Layout.fillHeight: true
      Layout.fillWidth: true
      Layout.verticalStretchFactor: 7

      GCanvas{
        id: _tableCanvas
        color: CurrentColorScheme.value.input.background.idle
        width: parent.width / 9 * 5
        anchors{
          left: parent.left
          top: parent.top
          bottom: parent.bottom
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
          syncView: _regKeyTableView
          model: [
            Russian.tableHeaders.regKeyUserFullName,
            Russian.tableHeaders.regKeyShortValue,
          ]
          delegate: GLabel{
            text: modelData
            font.pointSize: FontProperties.plainTextSize
          }
        }
        OrganisationRegKeyTableView{
          id: _regKeyTableView
          anchors{
            left: parent.left
            right: parent.right
            top: _hHeaderView.bottom
            topMargin: rowSpacing
            bottom: parent.bottom
          }
        }
      }
      Item{
        id: _tableIconButtons
        width: _root.calcButtonPreferredWidth()
        anchors{
          left: _tableCanvas.right
          leftMargin: 20
          top: parent.top
          bottom: parent.bottom
        }

        GIconButton{
          id: _regKeyTableApproveButton
          width: _root.calcButtonPreferredWidth()
          height: width
          lightIconSource: "qrc:///images/blackTickLight.png"
          darkIconSource: "qrc:///images/blackTickDark.png"
          anchors{
            top: parent.top
            topMargin: 20
            horizontalCenter: parent.horizontalCenter
          }
        }
        GIconButton{
          id: _regKeyTableDeleteButton
          width: _root.calcButtonPreferredWidth()
          height: width
          mipmapIcon: true
          lightIconSource: "qrc:///images/trashBinLight.png"
          darkIconSource: "qrc:///images/trashBinDark.png"
          anchors{
            top: _regKeyTableApproveButton.bottom
            topMargin: 20
            horizontalCenter: parent.horizontalCenter
          }
        }
        GIconButton{
          id: _regKeyTableEditButton
          width: _root.calcButtonPreferredWidth()
          height: width
          lightIconSource: "qrc:///images/pencilLight.png"
          darkIconSource: "qrc:///images/pencilDark.png"
          anchors{
            top: _regKeyTableDeleteButton.bottom
            topMargin: 20
            horizontalCenter: parent.horizontalCenter
          }
        }
      }
      Item{
        id: _navButtons
        anchors{
          right: parent.right
          left: _tableIconButtons.right
          leftMargin: 20
          top: parent.top
          bottom: parent.bottom
        }

        GButton{
          id: _generateRegKeys
          text: Russian.buttons.organisationGenerateKeys
          width: _root.calcButtonWidth(); height: _root.calcButtonHeight()
          anchors{
            bottom: _showLocalServicesButton.top
            bottomMargin: 20
            right: parent.right
            left: parent.left
          }
          onClicked: _root.pageCalled(Controls.regKeyGenerationDialog)
        }
        GButton{
          id: _showLocalServicesButton
          text: Russian.buttons.organisationShowServices
          width: _root.calcButtonWidth(); height: _root.calcButtonHeight()
          anchors{
            bottom: _returnToOrganisationListButton.top
            bottomMargin: 20
            right: parent.right
            left: parent.left
          }
          onClicked: _root.pageCalled(Controls.organisationLocalServicesPage)
        }
        GButton{
          id: _returnToOrganisationListButton
          text: Russian.buttons.returnToOrganisationList
          width: _root.calcButtonWidth(); height: _root.calcButtonHeight()
          anchors{
            bottom: _deleteButton.top
            bottomMargin: 20
            right: parent.right
            left: parent.left
          }
          onClicked: _root.pageCalled(Controls.organisationListPage)
        }
        GButton{
          id: _deleteButton
          width: _root.calcButtonWidth(); height: _root.calcButtonHeight()
          text: Russian.buttons.organisationDelete
          dangerous: true
          anchors{
            bottom: parent.bottom
            bottomMargin: 30
            right: parent.right
            left: parent.left
          }
        }
      }
    }
  }

  Component.onCompleted: {
    drawnIncorrectly()
  }

  function calcButtonWidth(){
    return _navButtons.width
  }

  function calcButtonHeight(){
    return _root.height / 12
  }

  function calcButtonPreferredWidth(){
    return WindowSizes.stdWidth / Controls.smallButtonsWidthRatio
  }

  function calcButtonPreferredHeight(){
    return WindowSizes.stdHeight / Controls.smallButtonsHeightRatio
  }

  function calcInputPreferredWidth(){
    return (_root.width - _infoLayout.columnSpacing - _infoLayout.anchors.leftMargin - _infoLayout.anchors.rightMargin) / 2
  }
}
