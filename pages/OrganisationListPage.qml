import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import '../types'
import '../types/models'
import '../types/basic'
import '../types/views'
import '../strings'
import '../config'

GPage{
  id: _root
  groupIndex: Controls.menuOrganisations
  index: Controls.organisationListPage

  property int organisations: 5
  signal pageCalled(int index)

  ColumnLayout{
    id: _pageLayout
    anchors{
      fill: parent
      centerIn: parent
      margins: 20
      bottomMargin: _organisationCreateButton.height
                  + _organisationCreateButton.anchors.bottomMargin
                  + spacing
    }
    spacing: 20


    GLabel{
      text: _root.getTopLabelText()
      Layout.fillHeight: true
      Layout.fillWidth: true
      Layout.verticalStretchFactor: 1
    }

    RowLayout{
      Layout.fillHeight: true
      Layout.fillWidth: true
      Layout.verticalStretchFactor: 9
      spacing: 20
      GCanvas{
        color: CurrentColorScheme.value.input.background.idle
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.horizontalStretchFactor: 8
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
          syncView: _organisationTableView
          model: [
            Russian.tableHeaders.organisationName,
            Russian.tableHeaders.organisationFax,
            Russian.tableHeaders.organisationAddress,
            Russian.tableHeaders.organisationTID,
          ]
          delegate: GLabel{
            text: modelData
            font.pointSize: FontProperties.plainTextSize
          }
        }
        OrganisationTableView{
          id: _organisationTableView
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
          id: _organisationTableAddButton
          width: _root.calcButtonPreferredWidth(); height: width
          lightIconSource: "qrc:///images/plusLight.png"
          darkIconSource: "qrc:///images/plusDark.png"
        }
        GIconButton{
          id: _organisationTableDeleteButton
          width: _root.calcButtonPreferredWidth(); height: width
          lightIconSource: "qrc:///images/minusLight.png"
          darkIconSource: "qrc:///images/minusDark.png"
        }
        GIconButton{
          id: _organisationTableMoreButton
          width: _root.calcButtonPreferredWidth(); height: width
          lightIconSource: "qrc:///images/dotsLight.png"
          darkIconSource: "qrc:///images/dotsDark.png"
          onClicked: _root.pageCalled(Controls.organisationDetailsPage)
        }
      }
    }
  }

    GButton{
      id: _organisationCreateButton
      text: Russian.buttons.organisationCreate
      anchors{
        bottom: parent.bottom
        horizontalCenter: parent.horizontalCenter
        bottomMargin: 20
      }

      minWidth: _root.calcButtonWidth()
      minHeight: _root.calcButtonHeight()
    }

  function getTopLabelText(){
    if(_root.organisations === 0)
      return Russian.labels.noOrganisations
    let str = Russian.labels.connectedWith + _root.organisations
    if(_root.organisations !== 0
        && _root.organisations % 10 !== 1
        || _root.organisations % 100 == 11)
      str += Russian.labels.withOrganisations
    else
      str += Russian.labels.withOrganisation
    return str
  }

  function calcButtonWidth(){
    return width / 2.4
  }

  function calcButtonHeight(){
    return height / 12
  }

  function calcButtonPreferredWidth(){
    return WindowSizes.stdWidth / Controls.smallButtonsWidthRatio
  }

  function calcButtonPreferredHeight(){
    return WindowSizes.stdHeight / Controls.smallButtonsHeightRatio
  }
}
