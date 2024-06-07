import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "../strings"
import "../types"
import "../types/basic"
import "../config"
import "../colorSchemes"
import "../js"
import "../pages"

Dialog{
  id: _dialog
  modal: true; dim: true
  width: WindowSizes.logInWidth
  height: WindowSizes.logInHeight


  contentItem: GCanvas{
    id: _content
    border.color: CurrentColorScheme.value.stroke.idle
    border.width: 1

    GLabel {
      id: _label
      text: Russian.dialogs.logIn
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
    Item{
      id: _userRow
      height: _dialog.calcImageWidth()
      anchors.top: _label.bottom
      anchors.margins: 20
      anchors.topMargin: 60
      anchors.left: parent.left
      anchors.right: parent.right
      Image {
        id: _userImage
        anchors{
          left: parent.left
          top: parent.top
        }
        source: CurrentColorScheme.value.dark ? "qrc:///images/UserDark"
                                              : "qrc:///images/UserLight"
        width: _dialog.calcImageWidth()
        height: width
      }
      GTextField{
        id: _userEmailInput
        anchors{
          left: _userImage.right
          leftMargin: 10
          right: parent.right
          top: parent.top
        }
        validator: RegularExpressionValidator{
          regularExpression: Russian.emailRegExp
        }

        height: _dialog.calcInputHeight()
      }
    }

    Item{
      id: _pwdRow
      height: _pwdImage.height > _pwdInput.height ? _pwdImage.height : _pwdInput.height
      anchors.top: _userRow.bottom
      anchors.margins: 20
      anchors.left: parent.left
      anchors.right: parent.right
      Image {
        id: _pwdImage
        anchors{
          left: parent.left
          top: parent.top
        }
        source: CurrentColorScheme.value.dark ? "qrc:///images/PasswordDark"
                                              : "qrc:///images/PasswordLight"
        width: _dialog.calcImageWidth()
        height: width
      }
      GTextField{
        id: _pwdInput
        echoMode: TextInput.Password
        anchors{
          left: _pwdImage.right
          leftMargin: 10
          right: parent.right
          top: parent.top
        }
        height: _dialog.calcInputHeight()
      }
    }

    GTextLink{
      id: _signUpLink
      anchors{
        top: _pwdRow.bottom
        topMargin: 40
        bottom: _logInButton.top
        bottomMargin: 20
        horizontalCenter: parent.horizontalCenter
      }

      text: Russian.buttons.signUp
      //onClicked:
    }

    GButton{
      id: _logInButton
      anchors{
        bottom: parent.bottom
        bottomMargin: 40
        horizontalCenter: parent.horizontalCenter
      }
      minWidth: _dialog.calcButtonWidth()
      minHeight: _dialog.calcButtonHeight()
      text: Russian.buttons.logIn
      onClicked: _dialog.accept()
    }

  }

  onOpened: {

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
