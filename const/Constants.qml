pragma Singleton

import QtQuick
import "../qml"

QtObject{
  id: windowConstants
  
  readonly property int stdWidth: 1920
  readonly property int stdHeight: 1080
  
  readonly property int signUpWidth: 600
  readonly property int signUpHeight: 880
  
  readonly property int logInWidth: 600
  readonly property int logInHeight: 620

  readonly property int organisationCreateWidth: 600
  readonly property int organisationCreateHeight: 720

  readonly property int formWidth: 640
  readonly property int formHeight: 960

  readonly property int bigFormWidth: 960
  readonly property int bigFormHeight: 1280

  readonly property int tallFormWidth: 640
  readonly property int tallFormHeight: 1280
}


