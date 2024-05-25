import QtQuick
import "types"
import "config"
import "colorSchemes"
import "js"

Window {
  width: WindowSizes.stdWidth
  height: WindowSizes.stdHeight
  visible: true
  title: qsTr("Hello World")

  GButton{
    id: item
    minWidth: 300
    minHeight: 100
    text: "Hello world!"
  }

  Component.onCompleted: {
    //console.log(DefaultColorScheme)
    console.log(item.minWidth)
    console.log(item.minHeight)
    console.log(item.width)
    console.log(item.height)

  }
}
