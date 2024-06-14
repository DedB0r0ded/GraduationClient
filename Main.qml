import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import app.frius.stateManagement

import "strings"
import "types/basic"
import "types"
import "dialogs"
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

  signal drawnIncorrectly


  id: mainWindow
  width: WindowSizes.stdWidth
  height: WindowSizes.stdHeight
  visible: true
  title: qsTr("Hello World")

  GCanvas{
    anchors.fill: parent
    anchors.centerIn: parent
    id: mainWindowBackground
  }

  LogInDialog{
    id: logInDialog
    anchors.centerIn: parent
    onRejected: Qt.quit()
  }



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
          id: menuProfileButton; focus: false
          width: menuDrawer.width; height: funs.calcMenuButtonHeight()
          text: Russian.menu.profile

          onFocusChanged:
              if(focus) funs.setMainMenuItem(Controls.menuProfile)
          onClicked: AppState.setActiveSectionTitle(Russian.menu.profile)
        }

        GButton{
          id: menuTasksButton; focus: false
          width: menuDrawer.width; height: funs.calcMenuButtonHeight()
          text: Russian.menu.tasks

          onFocusChanged:
              if(focus) funs.setMainMenuItem(Controls.menuTasks)
          onClicked: AppState.setActiveSectionTitle(Russian.menu.tasks)
        }

        GButton{
          id: menuOrganisationsButton; focus: false
          width: menuDrawer.width; height: funs.calcMenuButtonHeight()
          text: Russian.menu.organisations

          onFocusChanged:
              if(focus) funs.setMainMenuItem(Controls.menuOrganisations)
          onClicked: AppState.setActiveSectionTitle(Russian.menu.organisations)
        }

        GButton{
          id: menuContractsButton; focus: false
          width: menuDrawer.width; height: funs.calcMenuButtonHeight()
          text: Russian.menu.contracts

          onFocusChanged:
              if(focus) funs.setMainMenuItem(Controls.menuContracts)
          onClicked: AppState.setActiveSectionTitle(Russian.menu.contracts)
        }

        GButton{
          id: menuDeveloperButton; focus: false
          width: menuDrawer.width; height: funs.calcMenuButtonHeight()
          dangerous: true
          text: Russian.menu.developer

          onFocusChanged:
              if(focus) funs.setMainMenuItem(Controls.menuDeveloper)

          onClicked: {
            funs.openDevMenu()
            AppState.setActiveSectionTitle(Russian.menu.developer)
          }
        }
      }
      GButton{
          id: menuSignOutButton; focus: false
          y: funs.calcLastMenuButtonY(menuDrawer, height)
          width: menuDrawer.width; height: funs.calcMenuButtonHeight()
          text: Russian.menu.signOut
          dangerous: true

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
          id: devMenuComponentsButton; focus: false
          width: devMenuDrawer.width; height: funs.calcMenuButtonHeight()
          text: Russian.menu.components
          dangerous: true

          onFocusChanged:
              if(focus) funs.setDeveloperMenuItem(Controls.devMenuComponents)
        }

        GButton{
          id: devMenuFacilitesButton; focus: false
          width: devMenuDrawer.width; height: funs.calcMenuButtonHeight()
          dangerous: true
          text: Russian.menu.facilities

          onFocusChanged:
              if(focus) funs.setDeveloperMenuItem(Controls.devMenuFacilities)
        }

        GButton{
          id: devMenuServicesButton; focus: false
          width: devMenuDrawer.width; height: funs.calcMenuButtonHeight()
          text: Russian.menu.services
          dangerous: true

          onFocusChanged:
              if(focus) funs.setDeveloperMenuItem(Controls.devMenuServices)
        }

        GButton{
          id: devMenuManufacturersButton; focus: false
          width: devMenuDrawer.width; height: funs.calcMenuButtonHeight()
          visible: true; dangerous: true
          text: Russian.menu.manufacturers

          onFocusChanged:
              if(focus) funs.setDeveloperMenuItem(Controls.devMenuManufacturers)
        }
      }
      GButton{
          id: devMenuBackButton; focus: false
          y: funs.calcLastMenuButtonY(devMenuDrawer, height)
          width: devMenuDrawer.width; height: funs.calcMenuButtonHeight()
          text: Russian.menu.back
          dangerous: true

          onFocusChanged:
              if(focus) funs.setDeveloperMenuItem(Controls.devMenuBack)

          onClicked:{
            AppState.setActiveSectionTitle(Russian.menu.profile)
            funs.openMenu()
          }
        }
    }

  }



  SwipeView{
    id: mainSwipeView
    orientation: Qt.Vertical
    anchors.fill: parent
    currentIndex: mainWindow.selectedMainMenuItem
    interactive: false

    // TODO: Fix page components positioning when mainWindow is maximized
    Loader{
      id: profileLoader
      active: SwipeView.isCurrentItem
      sourceComponent: ProfilePage{
        id: profilePage
        onDrawnIncorrectly: mainWindow.drawnIncorrectly()
        onLoggedOut: logInDialog.open()
      }
    }

    Loader{
      id: tasksLoader
      active: SwipeView.isCurrentItem
      sourceComponent: TasksPage{
        id: tasksPage
        onDrawnIncorrectly: mainWindow.drawnIncorrectly()
      }
    }

    Loader{
      id: organisationSwipeViewLoader
      active: SwipeView.isCurrentItem
      sourceComponent: SwipeView{
        id: organisationSwipeView
        anchors.fill: parent
        anchors.centerIn: parent
        interactive: false
        currentIndex: 0
        Loader{
          id: organisationListPageLoader
          active: SwipeView.isCurrentItem
          sourceComponent: OrganisationListPage{
            onPageCalled: index => {
              organisationSwipeView.currentIndex = index
              mainWindow.drawnIncorrectly()
            }
          }
        }

        Loader{
          id: organisationDetailsPageLoader
          active: SwipeView.isCurrentItem
          sourceComponent: OrganisationDetailsPage{
            onDrawnIncorrectly: mainWindow.drawnIncorrectly()
            onPageCalled: index => {
              organisationSwipeView.currentIndex = index
              mainWindow.drawnIncorrectly()
            }
          }
        }
        Loader{
          id: organisationLocalServicesPageLoader
          active: SwipeView.isCurrentItem
          sourceComponent: OrganisationLocalServicesPage{
            onDrawnIncorrectly: mainWindow.drawnIncorrectly()
            onPageCalled: index => {
              organisationSwipeView.currentIndex = index
              mainWindow.drawnIncorrectly()
            }
          }
        }
      }
    }

    Loader{
      id: contractSwipeViewLoader
      active: SwipeView.isCurrentItem
      sourceComponent: SwipeView{
        id: contractSwipeView
        interactive: false
        Loader{
          id: contractListPageLoader
          active: SwipeView.isCurrentItem
          sourceComponent: ContractListPage{
            onDrawnIncorrectly: mainWindow.drawnIncorrectly()
            onPageCalled: index => {
              contractSwipeView.currentIndex = index
              mainWindow.drawnIncorrectly()
            }
          }
        }
        Loader{
          id: contractDetailsOneTimePageLoader
          active: SwipeView.isCurrentItem
          sourceComponent: ContractDetailsOneTimePage{
            onDrawnIncorrectly: mainWindow.drawnIncorrectly()
            onPageCalled: index => {
              contractSwipeView.currentIndex = index
              mainWindow.drawnIncorrectly()
            }
          }
        }
        Loader{
          id: contractDetailsMaintenancePageLoader
          active: SwipeView.isCurrentItem
          sourceComponent: ContractDetailsMaintenancePage{
            onDrawnIncorrectly: mainWindow.drawnIncorrectly()
            onPageCalled: index => {
              contractSwipeView.currentIndex = index
              mainWindow.drawnIncorrectly()
            }
          }
        }
        Loader{
          id: contractServiceListPageLoader
          active: SwipeView.isCurrentItem
          sourceComponent: ContractServiceListPage{
            onDrawnIncorrectly: mainWindow.drawnIncorrectly()
            onPageCalled: index => {
              contractSwipeView.currentIndex = index
              mainWindow.drawnIncorrectly()
            }
          }
        }
        Loader{
          id: contractMaintenanceListPageLoader
          active: SwipeView.isCurrentItem
          sourceComponent: ContractMaintenanceListPage{
            onDrawnIncorrectly: mainWindow.drawnIncorrectly()
            onPageCalled: index => {
              contractSwipeView.currentIndex = index
              mainWindow.drawnIncorrectly()
            }
          }
        }
      }
    }

    Loader{
      id: developerSwipeViewLoader
      active: SwipeView.isCurrentItem
      SwipeView{
        id: developerSwipeView
        interactive: false
        Loader{
          id: developerComponentListPageLoader
          sourceComponent: DeveloperComponentListPage{
            onDrawnIncorrectly: mainWindow.drawnIncorrectly()
            onPageCalled: index => {
              organisationSwipeView.currentIndex = index
              mainWindow.drawnIncorrectly()
            }
          }
        }
        Loader{
          id: developerFacilityListPageLoader
          sourceComponent: DeveloperFacilityListPage{
            onDrawnIncorrectly: mainWindow.drawnIncorrectly()
            onPageCalled: index => {
              organisationSwipeView.currentIndex = index
              mainWindow.drawnIncorrectly()
            }
          }
        }
        Loader{
          id: developerServiceListPageLoader
          sourceComponent: DeveloperServiceListPage{
            onDrawnIncorrectly: mainWindow.drawnIncorrectly()
            onPageCalled: index => {
              organisationSwipeView.currentIndex = index
              mainWindow.drawnIncorrectly()
            }
          }
        }
        Loader{
          id: developerManufacturerListPageLoader
          sourceComponent: DeveloperManufacturerListPage{
            onDrawnIncorrectly: mainWindow.drawnIncorrectly()
            onPageCalled: index => {
              organisationSwipeView.currentIndex = index
              mainWindow.drawnIncorrectly()
            }
          }
        }
      }
    }
  }



  Connections{
    target: AppState
    function onActiveSectionTitleChanged(title){
      let name = Russian.projectName + ' (' + title + ')'
      mainWindow.title = name
    }
  }

  onHeightChanged: drawnIncorrectly()

  onSelectedMainMenuItemChanged: {
    drawnIncorrectly()
  }

  Component.onCompleted: {
    //menuDeveloperButton.visible = false
    funs.openMenu()
    mainWindow.minimumMenuWidth = funs.calcMinimumMenuWidth()
    AppState.setActiveSectionTitle(Russian.menu.profile)
    logInDialog.open()
  }

  onDrawnIncorrectly: funs.refreshMainWindowWidth()

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
      devMenuComponentsButton.forceActiveFocus()
    }

    function refreshMainWindowWidth(){
      if(mainWindow.visibility == Window.FullScreen
          || mainWindow.visibility == Window.Maximized)
        return 0
      mainWindow.width += 1; mainWindow.width -= 1
    }

    function quit(){
      Qt.quit()
    }
  }

}
