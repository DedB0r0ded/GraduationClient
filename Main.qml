import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "strings"
import "types"
import "config"
import "colorSchemes"
import "js"

Window {
  property int minimumMenuWidth
  property int selectedMainMenuItem: 0
  property int selectedDeveloperMenuItem: 0


  id: mainWindow
  width: WindowSizes.stdWidth
  height: WindowSizes.stdHeight
  visible: true
  title: qsTr("Hello World")

  Drawer{
    id: menuDrawer
    width: funs.calcMenuDrawerWidth()
    height: mainWindow.height / Controls.menuHeightRatio
    modal: false; interactive: false
    background: Rectangle{
      color: CurrentColorScheme.value.control.background.idle
    }

    ColumnLayout{
      id: menuLayout
      spacing: 0

      GButton{
        Layout.topMargin: -30
        id: menuProfileButton
        minWidth: menuDrawer.width
        minHeight: funs.calcMenuButtonHeight()

        rounded: Controls.roundedButtons
        text: Russian.menu.profile

        focus: true
        previousTabItem: menuSignOutButton
        nextTabItem: menuTasksButton

        onFocusChanged:
            if(focus) funs.setMainMenuItem(Controls.menuProfile)
      }

      GButton{
        id: menuTasksButton
        minWidth: menuDrawer.width
        minHeight: funs.calcMenuButtonHeight()

        rounded: Controls.roundedButtons
        text: Russian.menu.tasks

        focus: false
        previousTabItem: menuProfileButton
        nextTabItem: menuOrganisationsButton

        onFocusChanged:
            if(focus) funs.setMainMenuItem(Controls.menuTasks)
      }

      GButton{
        id: menuOrganisationsButton
        minWidth: menuDrawer.width
        minHeight: funs.calcMenuButtonHeight()

        rounded: Controls.roundedButtons
        text: Russian.menu.organisations

        focus: false
        previousTabItem: menuTasksButton
        nextTabItem: menuContractsButton

        onFocusChanged:
            if(focus) funs.setMainMenuItem(Controls.menuOrganisations)
      }

      GButton{
        id: menuContractsButton
        minWidth: menuDrawer.width
        minHeight: funs.calcMenuButtonHeight()

        rounded: Controls.roundedButtons
        text: Russian.menu.contracts

        focus: false
        previousTabItem: menuOrganisationsButton
        nextTabItem: menuDeveloperButton.visible
                ? menuDeveloperButton
                : menuSignOutButton

        onFocusChanged:
            if(focus) funs.setMainMenuItem(Controls.menuContracts)
      }

      GButton{
        id: menuDeveloperButton
        minWidth: menuDrawer.width
        minHeight: funs.calcMenuButtonHeight()
        visible: false

        rounded: Controls.roundedButtons
        text: Russian.menu.developer

        focus: false
        previousTabItem: menuContractsButton
        nextTabItem: menuSignOutButton

        onFocusChanged:
            if(focus) funs.setMainMenuItem(Controls.menuDeveloper)
      }

      GButton{
        id: menuSignOutButton
        minWidth: menuDrawer.width
        minHeight: funs.calcMenuButtonHeight()

        rounded: Controls.roundedButtons
        text: Russian.menu.signOut
        dangerous: true

        focus: false
        previousTabItem: menuDeveloperButton.visible
                ? menuDeveloperButton
                : menuContractsButton
        nextTabItem: menuProfileButton

        Layout.topMargin:
            menuDrawer.height - height * 5

        onFocusChanged:
            if(focus) funs.setMainMenuItem(Controls.menuSignOut)
      }
    }
  }

  Drawer{
    id: devMenuDrawer
    width: funs.calcMenuDrawerWidth()
    height: mainWindow.height / Controls.menuHeightRatio
    modal: false; interactive: false
    background: Rectangle{
      color: CurrentColorScheme.value.danger.background.idle
    }

  }

  Component.onCompleted: {
    menuDrawer.open()
    mainWindow.minimumMenuWidth = funs.calcMinimumMenuWidth()
    menuProfileButton.forceActiveFocus()
  }

  QtObject{
    id: funs

    function calcMinimumMenuWidth(){
      let widths = []
      menuLayout.children.forEach(child =>
          widths.push(child.textWidth))
      return Math.max(...widths)
    }

    function calcMenuDrawerWidth(){
      return Math.max(mainWindow.minimumMenuWidth,
            mainWindow.width / Controls.menuWidthRatio)
    }

    function calcMenuButtonHeight(){
      return menuDrawer.height / Controls.menuButtonsHeighRatio
    }

    function setMainMenuItem(id){
      mainWindow.selectedMainMenuItem = id
      console.log("Current main menu item: " + id)
    }

    function setDeveloperMenuItem(id){
      mainWindow.selectedDeveloperMenuItem = id
    }
  }
}
