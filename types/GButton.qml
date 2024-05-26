import QtQuick
import "../config"

FocusScope {
  focus: true
  x: _button.x; y: _button.y
  width: _button.width
  height: _button.height
  property alias minWidth: _button.minWidth
  property alias minHeight: _button.minHeight
  property alias nextTabItem: _button.nextTabItem
  property alias previousTabItem: _button.previousTabItem
  property alias font: _button.font
  property alias text: _button.text


  GButtonTemplate{
    id: _button
    colors: CurrentColorScheme.value.control
    borderColors: CurrentColorScheme.value.stroke
  }

  onFocusChanged: if(focus) _button.forceActiveFocus()
}
