import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

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
  groupIndex: Controls.menuDeveloper
  index: Controls.devMenuServices

  signal pageCalled(int index)

  id: _root

  GCanvas{
    id: _tableCanvas

    HorizontalHeaderView{
      id: _tableHeader
    }
    ContractTableView{
      id: _tableView
    }
  }

  Column{
    id: _buttonColumn
    spacing: 20

    GIconButton{
      id: _tableAddButton
      width: _root.calcButtonPreferredWidth(); height: width
      lightIconSource: "qrc:///images/plusLight.png"
      darkIconSource: "qrc:///images/plusDark.png"
      //onClicked:
    }
    GIconButton{
      id: _tableEditButton
      width: _root.calcButtonPreferredWidth(); height: width
      lightIconSource: "qrc:///images/dotsLight.png"
      darkIconSource: "qrc:///images/dotsDark.png"
      //onClicked:
    }
    GIconButton{
      id: _tableDeleteButton
      width: _root.calcButtonPreferredWidth(); height: width
      lightIconSource: "qrc:///images/minusLight.png"
      darkIconSource: "qrc:///images/minusDark.png"
      //onClicked:
    }
  }

  function calcButtonPreferredWidth(){
    return WindowSizes.stdWidth / Controls.smallButtonsWidthRatio
  }

  function calcButtonPreferredHeight(){
    return WindowSizes.stdHeight / Controls.smallButtonsHeightRatio
  }
}
