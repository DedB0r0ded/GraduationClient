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
//#########################################################
GDialog{
  id: _dialog
  sectionTitle: Russian.dialogs.signUp
  width: WindowSizes.signUpWidth
  height: WindowSizes.signUpHeight


  contentItem: GCanvas{
    id: _content
    border.color: CurrentColorScheme.value.stroke.idle
    border.width: 1

    GLabel {
      id: _label
      text: _dialog.sectionTitle
      anchors{
        margins: 20
        left: parent.left
        right: parent.right
        top: parent.top
      }
      height: _dialog.calcLabelHeight()
      font.weight: FontProperties.headerTextWeight
      border{
        width: 3
        color: CurrentColorScheme.value.stroke.idle
      }
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
