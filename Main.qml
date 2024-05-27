import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "strings"
import "types"
import "config"
import "colorSchemes"
import "js"

Window {
  id: mainWindow
  width: WindowSizes.stdWidth
  height: WindowSizes.stdHeight
  visible: true
  title: qsTr("Hello World")

  Drawer{
    id: menuDrawer
    width: mainWindow.width / ControlsProperties.menuWidthRatio
    height: mainWindow.height / ControlsProperties.menuHeightRatio
    modal: false; interactive: false
    background: Rectangle{
      anchors.fill: parent
      anchors.centerIn: parent
      color: CurrentColorScheme.value.control.background.idle
    }

    ColumnLayout{
      spacing: 0

      GButton{
        id: menuProfileButton
        minWidth: menuDrawer.width
        minHeight: funs.calcMenuButtonHeight()

        rounded: ControlsProperties.roundedButtons
        text: Russian.menu.profile

        focus: false
        previousTabItem: menuSignOutButton
        nextTabItem: menuTasksButton
      }

      GButton{
        id: menuTasksButton
        minWidth: menuDrawer.width
        minHeight: funs.calcMenuButtonHeight()

        rounded: ControlsProperties.roundedButtons
        text: Russian.menu.tasks

        focus: false
        previousTabItem: menuProfileButton
        nextTabItem: menuOrganisationsButton
      }

      GButton{
        id: menuOrganisationsButton
        minWidth: menuDrawer.width
        minHeight: funs.calcMenuButtonHeight()

        rounded: ControlsProperties.roundedButtons
        text: Russian.menu.organisations

        focus: false
        previousTabItem: menuTasksButton
        nextTabItem: menuContractsButton
      }

      GButton{
        id: menuContractsButton
        minWidth: menuDrawer.width
        minHeight: funs.calcMenuButtonHeight()

        rounded: ControlsProperties.roundedButtons
        text: Russian.menu.contracts

        focus: false
        previousTabItem: menuOrganisationsButton
        nextTabItem: menuDeveloperButton.visible
                ? menuDeveloperButton
                : menuSignOutButton
      }

      GButton{
        id: menuDeveloperButton
        minWidth: menuDrawer.width
        minHeight: funs.calcMenuButtonHeight()
        visible: false

        rounded: ControlsProperties.roundedButtons
        text: Russian.menu.developer

        focus: false
        previousTabItem: menuContractsButton
        nextTabItem: menuSignOutButton
      }

      GButton{
        id: menuSignOutButton
        minWidth: menuDrawer.width
        minHeight: funs.calcMenuButtonHeight()

        rounded: ControlsProperties.roundedButtons
        text: Russian.menu.signOut
        dangerous: true

        focus: false
        previousTabItem: menuDeveloperButton.visible
                ? menuDeveloperButton
                : menuContractsButton
        nextTabItem: menuProfileButton

        Layout.topMargin:
            menuDrawer.height - height * 5 - 1
      }
    }
  }

  Component.onCompleted: {
    menuDrawer.open()
  }

  QtObject{
    id: funs

    function calcMenuButtonHeight(){
      return menuDrawer.height / ControlsProperties.menuButtonsHeighRatio
    }
  }
}
