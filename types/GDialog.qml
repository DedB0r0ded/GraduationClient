import QtQuick
import QtQuick.Controls

import '../config'
import '../types'
import '../strings'

Dialog{
  required property string sectionTitle

  modal: true; dim: true
  onOpened: {
    AppState.pushActiveSectionTitle(sectionTitle)
  }
  onClosed: {
    AppState.popActiveSectionTitle()
  }
}
