import QtQuick
import "../config"

FocusScope {
  id: _root; focus: true
  x: _button.x; y: _button.y
  width: _button.width; height: _button.height
  property alias minWidth: _button.minWidth
  property alias minHeight: _button.minHeight

  property alias nextTabItem: _button.nextTabItem
  property alias previousTabItem: _button.previousTabItem

  readonly property alias textWidth: _button.textWidth
  readonly property alias textHeight: _button.textHeight

  property alias rounded: _button.rounded
  property alias font: _button.font
  property alias text: _button.text

  property bool dangerous: false


  GButtonTemplate{
    id: _button
    colors: _root.dangerous
      ? CurrentColorScheme.value.danger
      : CurrentColorScheme.value.control
    borderColors: CurrentColorScheme.value.stroke
    font.pointSize: FontProperties.standartTextSize
  }

  onFocusChanged: if(focus) _button.forceActiveFocus()
}
