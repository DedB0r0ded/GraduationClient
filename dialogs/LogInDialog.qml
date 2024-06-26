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
  id: _dialog
  sectionTitle: Russian.dialogs.logIn
  width: WindowSizes.logInWidth
  height: WindowSizes.logInHeight

  SignUpDialog{ id: _signUpDialog }
  GErrorDialog{
    id: _invalidEmailMessage
    title: Russian.messages.invalidEmail
  }
  GErrorDialog{
    id: _invalidPasswordMessage
    title: Russian.messages.invalidPassword
  }

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
        width: _dialog.calcImageWidth(); height: width
        anchors{
          left: parent.left
          top: parent.top
        }
        source: CurrentColorScheme.value.dark ? "qrc:///images/PasswordDark"
                                              : "qrc:///images/PasswordLight"
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
        validator: RegularExpressionValidator{
          regularExpression: Russian.passwordRegExp
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
      onClicked: _signUpDialog.open()
    }

    GButton{
      id: _logInButton
      width: _dialog.calcButtonWidth(); height: _dialog.calcButtonHeight()
      anchors{
        bottom: parent.bottom
        bottomMargin: 40
        horizontalCenter: parent.horizontalCenter
      }
      text: Russian.buttons.logIn
      onClicked: _dialog.initLogIn()
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

  function initLogIn(){
    if(!_userEmailInput.acceptableInput){
      _invalidEmailMessage.open()
      return
    }
    if(!_pwdInput.acceptableInput){
      _invalidPasswordMessage.open()
      return
    }
    AppWrapper.fetchUser(_userEmailInput.text, _pwdInput.text)
    accept()
  }
}
