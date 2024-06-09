import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import app.frius.stateManagement

import "../strings"
import "../types"
import "../types/basic"
import "../config"
import "../colorSchemes"
import "../js"
import "../pages"

GDialog{
  id: _dialog; clip: true
  sectionTitle: Russian.dialogs.info
  width: WindowSizes.dialogWidth
  height: WindowSizes.dialogHeight
  padding: 0

  GCanvas{

    Flickable{
      anchors.fill: parent
      anchors.centerIn: parent
      boundsBehavior: Flickable.StopAtBounds
      contentHeight: _infoLabel.implicitHeight
      interactive: true

      GLabel{
        id: _infoLabel
        width: _dialog.width
        padding: 5
        anchors{
          fill: undefined
          centerIn: undefined
        }

        border{
          width: 3
          color: CurrentColorScheme.value.stroke.active
        }

        horizontalAlignment: Qt.AlignJustify
        verticalAlignment: Qt.AlignTop
        font{
          weight: FontProperties.plainTextWeight
          pointSize: FontProperties.plainTextSize
        }
        text: Russian.info
        wrapMode: Text.WordWrap
      }

      ScrollBar.vertical: ScrollBar{ }
    }
  }



  function calcImageWidth(){
    return width / 7.5
  }

  function calcInputWidth(){
    return width / 10 * 6
  }
  function calcInputHeight(){
    return height / 7.75
  }

  function calcButtonWidth(){
    return width / 2
  }
  function calcButtonHeight(){
    return height / 7.75
  }

  function calcLabelHeight(){
    return height / 5
  }
}
