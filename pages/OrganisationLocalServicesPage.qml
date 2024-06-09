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
  index: Controls.organisationLocalServicesPage

  signal pageCalled(int index)


  GCanvas{
    anchors{
      fill: parent
      centerIn: parent
    }

    GCanvas{
      id: _tableCanvas
      color: CurrentColorScheme.value.input.background.idle
      width: parent.width * 0.9
      anchors{
        left: parent.left
        top: parent.top
        topMargin: 20
        leftMargin: 20
        bottom: parent.bottom
        bottomMargin: 20
        fill: undefined
        centerIn: undefined
      }

      HorizontalHeaderView{
        id: _hHeaderView
        anchors{
          left: _serviceTableView.left
          right: _serviceTableView.right
          top: parent.top
        }
        rowHeightProvider: row => {return 80}
        syncView: _serviceTableView
        model: [
          Russian.tableHeaders.organisationServiceName,
          Russian.tableHeaders.organisationServiceCost,
          Russian.tableHeaders.organisationServiceFacility,
        ]
        delegate: GLabel{
          text: modelData
          font.pointSize: FontProperties.plainTextSize
        }
      }

      OrganisationLocalServiceTableView{
        id: _serviceTableView
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
      anchors{
        right: parent.right
        left: _tableCanvas.right
        leftMargin: 10
        top: parent.top
        topMargin: _tableCanvas.anchors.topMargin + 10
      }

      spacing: 20
      GIconButton{
        id: _serviceTableAddButton
        width: _root.calcButtonPreferredWidth(); height: width
        lightIconSource: "qrc:///images/plusLight.png"
        darkIconSource: "qrc:///images/plusDark.png"
      }
      GIconButton{
        id: _serviceTableDeleteButton
        width: _root.calcButtonPreferredWidth(); height: width
        lightIconSource: "qrc:///images/minusLight.png"
        darkIconSource: "qrc:///images/minusDark.png"
      }
      GIconButton{
        id: _serviceTableEditButton
        width: _root.calcButtonPreferredWidth(); height: width
        lightIconSource: "qrc:///images/pencilLight.png"
        darkIconSource: "qrc:///images/pencilDark.png"
      }
      GIconButton{
        id: _backToDetailsButton
        width: _root.calcButtonPreferredWidth(); height: width
        lightIconSource: "qrc:///images/backArrowLight.png"
        darkIconSource: "qrc:///images/backArrowDark.png"
        onClicked: _root.pageCalled(Controls.organisationDetailsPage)
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
