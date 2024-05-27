pragma Singleton

import QtQuick

QtObject {
  readonly property real menuWidthRatio: 4.0
  readonly property real menuHeightRatio: 1.0

  readonly property real menuButtonsHeighRatio: 10.8

  // 80x80
  readonly property real smallButtonsWidthRatio: 24.0
  readonly property real smallButtonsHeightRatio: 13.5

  // 160x80
  readonly property real basicButtonsWidthRatio: 12.0
  readonly property real basicButtonsHeightRatio: 13.5

  // 300x90
  readonly property real largeButtonsWidthRatio: 6.4
  readonly property real largeButtonsHeightRatio: 12.0

  readonly property bool roundedButtons: false
}
