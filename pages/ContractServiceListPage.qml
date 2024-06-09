import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import com.frius.states

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
