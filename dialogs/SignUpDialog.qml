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
  sectionTitle: Russian.dialogs.signUp
  width: WindowSizes.signUpWidth
  height: WindowSizes.signUpHeight
  padding: 0

  InfoDialog{
    id: _info
    anchors.centerIn: Overlay.overlay
  }

  contentItem: GCanvas{
    id: _content
    anchors{
      fill: undefined
      centerIn: undefined
    }

    x: 0; y: 0
    width: _dialog.width
    height: _dialog.height

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

    GTextField{
      id: _firstNameInput
      height: _dialog.calcInputHeight()
      anchors{
        top: _label.bottom; topMargin: _dialog.calcInputTopMargin()
        left: parent.left; leftMargin: _dialog.calcInputMargin()
        right: parent.right; rightMargin: _dialog.calcInputMargin()
      }
      placeholderText: Russian.labels.firstName
    }

    GTextField{
      id: _middleNameInput
      height: _dialog.calcInputHeight()
      anchors{
        top: _firstNameInput.bottom; topMargin: _dialog.calcInputTopMargin()
        left: parent.left; leftMargin: _dialog.calcInputMargin()
        right: parent.right; rightMargin: _dialog.calcInputMargin()
      }
      placeholderText: Russian.labels.middleName
    }

    GTextField{
      id: _lastNameInput
      height: _dialog.calcInputHeight()
      anchors{
        top: _middleNameInput.bottom; topMargin: _dialog.calcInputTopMargin()
        left: parent.left; leftMargin: _dialog.calcInputMargin()
        right: parent.right; rightMargin: _dialog.calcInputMargin()
      }
      placeholderText: Russian.labels.lastName
    }

    GTextField{
      id: _emailInput
      height: _dialog.calcInputHeight()
      anchors{
        top: _lastNameInput.bottom; topMargin: _dialog.calcInputTopMargin()
        left: parent.left; leftMargin: _dialog.calcInputMargin()
        right: parent.right; rightMargin: _dialog.calcInputMargin()
      }
      placeholderText: Russian.labels.email
    }

    GTextField{
      id: _pwdInput
      height: _dialog.calcInputHeight()
      anchors{
        top: _emailInput.bottom; topMargin: _dialog.calcInputTopMargin()
        left: parent.left; leftMargin: _dialog.calcInputMargin()
        right: parent.right; rightMargin: _dialog.calcInputMargin()
      }
      placeholderText: Russian.labels.password
    }

    GTextField{
      id: _pwdConfirmationInput
      height: _dialog.calcInputHeight()
      anchors{
        top: _pwdInput.bottom; topMargin: _dialog.calcInputTopMargin()
        left: parent.left; leftMargin: _dialog.calcInputMargin()
        right: parent.right; rightMargin: _dialog.calcInputMargin()
      }
      placeholderText: Russian.labels.passwordConfirmation
    }

    GTextLink{
      id: _infoLink
      width: _dialog.width * 11 / 30
      anchors{
        top: _pwdConfirmationInput.bottom; topMargin: _dialog.calcControlTopMargin()
        bottom: parent.bottom; bottomMargin: _dialog.calcControlTopMargin()
        left: parent.left; leftMargin: _dialog.calcInputMargin()
      }
      text: Russian.buttons.info
      onClicked: _info.open()
    }

    GButton{
      id: _signUpButton
      anchors{
        top: _pwdConfirmationInput.bottom; topMargin: _dialog.calcControlTopMargin()
        bottom: parent.bottom; bottomMargin: _dialog.calcControlTopMargin()
        left: _infoLink.right; leftMargin: _dialog.calcInputMargin()
        right: parent.right; rightMargin: _dialog.calcInputMargin()
      }
      text: Russian.buttons.signUp
      textSize: FontProperties.buttonTextSize - 4
      onClicked: _dialog.accept()
    }
  }

  function calcControlTopMargin(){
    return calcInputTopMargin() + 30
  }

  function calcInputTopMargin(){
    return height / 40
  }
  function calcInputMargin(){
    return width / 20
  }

  function calcInputWidth(){
    return width / 10 * 6
  }
  function calcInputHeight(){
    return height * 3 / 40
  }

  function calcButtonWidth(){
    return width / 2
  }
  function calcButtonHeight(){
    return height / 10
  }

  function calcLabelHeight(){
    return height * 3 / 20
  }
}
