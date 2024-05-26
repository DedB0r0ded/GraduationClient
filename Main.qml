import QtQuick
import QtQuick.Layouts
import "types"
import "config"
import "colorSchemes"
import "js"

Window {
  width: WindowSizes.stdWidth
  height: WindowSizes.stdHeight
  visible: true
  title: qsTr("Hello World")

  RowLayout{
    spacing: 20
    GButton{
      id: button1
      minWidth: 260
      minHeight: 80
      text: "button1"
      previousTabItem: button5
      nextTabItem: button2
      //colors: CurrentColorScheme.value.control
      onActiveFocusChanged: if(activeFocus) console.log("B1")
    }
    GButton{
      id: button2
      minWidth: 260
      minHeight: 80
      text: "button2"
      previousTabItem: button1
      nextTabItem: button3
      //colors: CurrentColorScheme.value.control
      onActiveFocusChanged: if(activeFocus) console.log("B2")
    }
    GButton{
      id: button3
      minWidth: 260
      minHeight: 80
      text: "button3"
      previousTabItem: button2
      nextTabItem: button4
      //colors: CurrentColorScheme.value.control
      onActiveFocusChanged: if(activeFocus) console.log("B3")
    }
    GButton{
      id: button4
      minWidth: 260
      minHeight: 80
      text: "button4"
      previousTabItem: button3
      nextTabItem: button5
      //colors: CurrentColorScheme.value.control
      onActiveFocusChanged: if(activeFocus) console.log("B4")
    }

    GButton{
      id: button5
      minWidth: 260
      minHeight: 80
      text: "button4"
      previousTabItem: button4
      nextTabItem: button1
      //colors: CurrentColorScheme.value.control
      onActiveFocusChanged: if(activeFocus) console.log("B5")
    }

    GTextArea{
      width: 300
      height: 100
    }
  }

}
