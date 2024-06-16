import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import app.frius.stateManagement

import "../strings"
import "../types/basic"
import "../types/views"
import "../types"
import "../dialogs"
import "../config"
import "../colorSchemes"
import "../js"
import "../pages"

GPage{
  groupIndex: Controls.menuContracts
  index: Controls.contractListPage

  signal pageCalled(int index)

  id: _root


  GCanvas{
    id: _tableCanvas
    width: parent.width / 9 * 8
    color: CurrentColorScheme.value.input.background.idle
    anchors{
      fill: undefined; centerIn: undefined
      top: parent.top; bottom: parent.bottom
      left: parent.left
      topMargin: 20; bottomMargin: 20
      leftMargin: 20
    }

    HorizontalHeaderView{
      id: _tableHeader
      rowHeightProvider: column => { return 80 }
      syncView: _tableView
      model: [
        Russian.tableHeaders.contractCustomerName,
        Russian.tableHeaders.contractContractorName,
        Russian.tableHeaders.contractConclusionDate,
        Russian.tableHeaders.contractContinuous
      ]
      delegate: GLabel{
        text: modelData
        font.pointSize: FontProperties.plainTextSize
      }
      anchors.top: parent.top
    }

    ContractTableView{
      id: _tableView
      anchors{
        top: _tableHeader.bottom; bottom: parent.bottom
        left: parent.left; right: parent.right
        topMargin: rowSpacing
      }
    }
  }

  Column{
    id: _buttonColumn
    spacing: 20
    anchors{
      top: parent.top;
      left: _tableCanvas.right; right: parent.right
      topMargin: _tableCanvas.anchors.topMargin + 20
    }

    GIconButton{
      id: _tableAddButton
      width: _root.calcButtonPreferredWidth(); height: width
      lightIconSource: "qrc:///images/plusLight.png"
      darkIconSource: "qrc:///images/plusDark.png"
      anchors.horizontalCenter: parent.horizontalCenter
      //onClicked:
    }
    GIconButton{
      id: _tableEditButton
      width: _root.calcButtonPreferredWidth(); height: width
      lightIconSource: "qrc:///images/dotsLight.png"
      darkIconSource: "qrc:///images/dotsDark.png"
      anchors.horizontalCenter: parent.horizontalCenter
      //onClicked:
    }
    GIconButton{
      id: _tableDeleteButton
      width: _root.calcButtonPreferredWidth(); height: width
      lightIconSource: "qrc:///images/minusLight.png"
      darkIconSource: "qrc:///images/minusDark.png"
      anchors.horizontalCenter: parent.horizontalCenter
      //onClicked:
    }
  }


  Connections{
    target: _tableView.mySelectionModel
    function onSelectionChanged(){
      console.log(_tableView.mySelectionModel.currentIndex.row)
    }
  }

  function calcButtonPreferredWidth(){
    return WindowSizes.stdWidth / Controls.smallButtonsWidthRatio
  }

  function calcButtonPreferredHeight(){
    return WindowSizes.stdHeight / Controls.smallButtonsHeightRatio
  }
}
