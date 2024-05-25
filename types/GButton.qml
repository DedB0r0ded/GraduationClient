import QtQuick
import "../config"

Item {
  property alias minWidth: _button.minWidth
  property alias minHeight: _button.minHeight
  property alias text: _button.text

  GButtonTemplate{
    id: _button
    colors: CurrentColorScheme.value.basic
  }
}
