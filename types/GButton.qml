import QtQuick
import "../config"

Item {
  property alias minWidth: _button.minWidth
  property alias minHeight: _button.minHeight
  property bool hovered: _button.hovered
  width: _button.width
  height: _button.height
  property alias text: _button.text

  GButtonTemplate{
    id: _button
    colors: CurrentColorScheme.value.basic
  }
}
