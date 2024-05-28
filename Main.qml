import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "strings"
import "types"
import "types/basic"
import "config"
import "colorSchemes"
import "js"
import "pages"

Window {
  property int minimumMenuWidth
  property int selectedMainMenuItem: 0
  property int selectedDeveloperMenuItem: 0

  property int pageWidth: funs.calcPageWidth()
  property int menuWidth: funs.calcMenuWidth()


  id: mainWindow
  width: WindowSizes.stdWidth
  height: WindowSizes.stdHeight
  visible: true
  title: qsTr("Hello World")

  GCanvas{ id: mainWindowBackground }

  Item{
    id: menuContainer
    width: mainWindow.menuWidth
    height: mainWindow.height / Controls.menuHeightRatio

    Drawer{
      id: menuDrawer
      width: menuContainer.width; height: menuContainer.height
      modal: false; interactive: false
      background: Rectangle{
        color: CurrentColorScheme.value.control.background.idle
      }

      Column{
        id: menuLayout
        spacing: 0

        GButton{
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
          dangerous: true

          rounded: Controls.roundedButtons
          text: Russian.menu.developer

          focus: false
          previousTabItem: menuContractsButton
          nextTabItem: menuSignOutButton

          onFocusChanged:
              if(focus) funs.setMainMenuItem(Controls.menuDeveloper)

          onClicked: funs.openDevMenu()
        }
      }
        GButton{
          id: menuSignOutButton
          y: funs.calcLastMenuButtonY(menuDrawer, height)
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

          onFocusChanged:
              if(focus) funs.setMainMenuItem(Controls.menuSignOut)

          onClicked: funs.quit()
        }

    }

    Drawer{
      id: devMenuDrawer
      width: menuContainer.width; height: menuContainer.height
      modal: false; interactive: false
      background: Rectangle{
        color: CurrentColorScheme.value.danger.background.idle
      }

      Column{
        id: devMenuLayout
        spacing: 0

        GButton{
          id: devMenuBanksButton
          minWidth: devMenuDrawer.width
          minHeight: funs.calcMenuButtonHeight()

          rounded: Controls.roundedButtons
          text: Russian.menu.banks
          dangerous: true

          focus: true
          previousTabItem: devMenuBackButton
          nextTabItem: devMenuComponentsButton

          onFocusChanged:
              if(focus) funs.setDeveloperMenuItem(Controls.devMenuBanks)
        }

        GButton{
          id: devMenuComponentsButton
          minWidth: devMenuDrawer.width
          minHeight: funs.calcMenuButtonHeight()

          rounded: Controls.roundedButtons
          text: Russian.menu.components
          dangerous: true

          focus: false
          previousTabItem: devMenuBanksButton
          nextTabItem: devMenuFacilitesButton

          onFocusChanged:
              if(focus) funs.setDeveloperMenuItem(Controls.devMenuComponents)
        }

        GButton{
          id: devMenuFacilitesButton
          minWidth: devMenuDrawer.width
          minHeight: funs.calcMenuButtonHeight()
          dangerous: true

          rounded: Controls.roundedButtons
          text: Russian.menu.facilities

          focus: false
          previousTabItem: devMenuComponentsButton
          nextTabItem: devMenuServicesButton

          onFocusChanged:
              if(focus) funs.setDeveloperMenuItem(Controls.devMenuFacilities)
        }

        GButton{
          id: devMenuServicesButton
          minWidth: devMenuDrawer.width
          minHeight: funs.calcMenuButtonHeight()
          dangerous: true

          rounded: Controls.roundedButtons
          text: Russian.menu.services

          focus: false
          previousTabItem: devMenuFacilitesButton
          nextTabItem: devMenuManufacturersButton

          onFocusChanged:
              if(focus) funs.setDeveloperMenuItem(Controls.devMenuServices)
        }

        GButton{
          id: devMenuManufacturersButton
          minWidth: devMenuDrawer.width
          minHeight: funs.calcMenuButtonHeight()
          visible: true; dangerous: true

          rounded: Controls.roundedButtons
          text: Russian.menu.manufacturers

          focus: false
          previousTabItem: devMenuServicesButton
          nextTabItem: devMenuBackButton

          onFocusChanged:
              if(focus) funs.setDeveloperMenuItem(Controls.devMenuManufacturers)
        }
      }
        GButton{
          id: devMenuBackButton
          y: funs.calcLastMenuButtonY(devMenuDrawer, height)
          minWidth: devMenuDrawer.width
          minHeight: funs.calcMenuButtonHeight()
          visible: true; dangerous: true

          rounded: Controls.roundedButtons
          text: Russian.menu.back

          focus: false
          previousTabItem: devMenuManufacturersButton
          nextTabItem: devMenuBanksButton

          onFocusChanged:
              if(focus) funs.setDeveloperMenuItem(Controls.devMenuBack)

          onClicked: funs.openMenu()
        }
    }

  }



  SwipeView{
    id: mainSwipeView
    orientation: Qt.Vertical
    anchors.fill: parent
    currentIndex: mainWindow.selectedMainMenuItem


    Loader{
      id: profileLoader
      active: SwipeView.isCurrentItem
      sourceComponent: ProfilePage{
        width: mainWindow.width / Controls.pageWidthRatio
        height: mainWindow.height
      }
    }

    Loader{
      id: tasksLoader
      active: SwipeView.isCurrentItem
      sourceComponent: TasksPage{}
    }

    Loader{
      id: organisationSwipeViewLoader
      active: SwipeView.isCurrentItem
      SwipeView{
        id: organisationSwipeView
        Loader{
          id: organisationListPageLoader
          sourceComponent: OrganisationListPage{}
        }
        Loader{
          id: organisationDetailsPageLoader
          sourceComponent: OrganisationDetailsPage{}
        }
        Loader{
          id: organisationLocalServicesPageLoader
          sourceComponent: OrganisationLocalServicesPage{}
        }
      }
    }
    Loader{
      id: contractSwipeViewLoader
      active: SwipeView.isCurrentItem
      SwipeView{
        id: contractSwipeView
        Loader{
          id: contractListPageLoader
          sourceComponent: ContractListPage{}
        }
        Loader{
          id: contractDetailsOneTimePageLoader
          sourceComponent: ContractDetailsOneTimePage{}
        }
        Loader{
          id: contractDetailsMaintenancePageLoader
          sourceComponent: ContractDetailsMaintenancePage{}
        }
        Loader{
          id: contractServiceListPageLoader
          sourceComponent: ContractServiceListPage{}
        }
        Loader{
          id: contractMaintenanceListPageLoader
          sourceComponent: ContractMaintenanceListPage{}
        }
      }
    }

    Loader{
      id: developerSwipeViewLoader
      active: SwipeView.isCurrentItem
      SwipeView{
        id: developerSwipeView
        Loader{

        }
      }
    }
  }


  Component.onCompleted: {
    //menuDeveloperButton.visible = false
    funs.openMenu()
    mainWindow.minimumMenuWidth = funs.calcMinimumMenuWidth()
    mainWindow.width += 1; mainWindow.width -= 1
  }

  QtObject{
    id: funs

    function calcMinimumMenuWidth(){
      let widths = []
      menuLayout.children.forEach(child =>
          widths.push(child.textWidth))
      return Math.max(...widths)
    }

    function calcMenuWidth(){
      return Math.max(mainWindow.minimumMenuWidth,
            mainWindow.width / Controls.menuWidthRatio)
    }

    function calcPageWidth(){
      return mainWindow.width - calcMenuWidth()
    }

    function calcMenuButtonHeight(){
      return menuDrawer.height / Controls.menuButtonsHeighRatio
    }

    function calcLastMenuButtonY(drawer, buttonHeight){
      return drawer.height - buttonHeight
    }

    function setMainMenuItem(id){
      mainWindow.selectedMainMenuItem = id
      //console.log("Current main menu item: " + id)
    }

    function setDeveloperMenuItem(id){
      mainWindow.selectedDeveloperMenuItem = id
      //console.log("Current dev menu item: " + id)
    }

    function openMenu(){
      devMenuDrawer.close()
      menuDrawer.open()
      menuProfileButton.forceActiveFocus()
    }

    function openDevMenu(){
      devMenuDrawer.open()
      menuDrawer.close()
      devMenuBanksButton.forceActiveFocus()
    }

    function quit(){
      Qt.quit()
    }
  }
}
