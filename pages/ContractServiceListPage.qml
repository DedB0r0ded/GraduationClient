import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import app.frius.stateManagement

import "../strings"
import "../types/basic"
import "../types"
import "../dialogs"
import "../config"
import "../colorSchemes"
import "../js"
import "../pages"

GPage{
  groupIndex: Controls.menuContracts
  index: Controls.contractServiceListPage

  signal pageCalled(int index)
}
