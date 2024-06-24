import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import app.frius.stateManagement

import "../strings"
import "../types"
import "../types/basic"
import "../config"
import "../colorSchemes"
import "../js"
import "../pages"

GDialog{
  id: _root
  standardButtons: Dialog.Ok
  sectionTitle: Russian.messages.error
  anchors.centerIn: Overlay.overlay
}
