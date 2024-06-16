pragma Singleton

import QtQuick

QtObject {
  readonly property real menuWidthRatio: 4.0
  readonly property real menuHeightRatio: 1.0

  readonly property real menuButtonsHeighRatio: 10.8

  readonly property real pageWidthRatio: 1 * 4 / 3

  readonly property real profileInfoLayoutHeightRatio: 1 * 54 / 19
  readonly property real profileInfoLayoutRowSpacingRatio: 54
  readonly property real profileInfoLayoutColumnSpacingRatio: 18
  readonly property real profileNotificationLayoutRowSpacingRatio: 54
  readonly property real profileNotificationLayoutColumnSpacingRatio: 108

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
  readonly property bool roundedIconButtons: true

  readonly property real basicInputWidthRatio: 3.0
  readonly property real basicInputHeightRatio: 24.0

  readonly property int menuProfile: 0
  readonly property int menuTasks: 1
  readonly property int menuOrganisations: 2
  readonly property int menuContracts: 3
  readonly property int menuDeveloper: 4
  readonly property int menuSignOut: 5

  readonly property int devMenuComponents: 0
  readonly property int devMenuFacilities: 1
  readonly property int devMenuManufacturers: 2
  readonly property int devMenuServices: 3
  readonly property int devMenuBack: 4

  readonly property int organisationListPage: 0
  readonly property int organisationDetailsPage: 1
  readonly property int organisationLocalServicesPage: 2

  readonly property int contractListPage: 0
  readonly property int contractDetailsPage: 1
  readonly property int contractMaintenanceListPage: 2
  readonly property int contractServiceListPage: 3

  readonly property int logInDialog: 100
  readonly property int signUpDialog: 110
  readonly property int organisationCreateDialog: 120
  readonly property int globalComponentDialog: 130
  readonly property int globalFacilityDialog: 140
  readonly property int globalServiceDialog: 150

  readonly property int contractFacilityDialog: 142
  readonly property int facilityReviewDialog: 143
  readonly property int localServiceDialog: 151
  readonly property int contractServiceDialog: 152

  readonly property int regKeyDialog: 160
  readonly property int regKeyGenerationDialog: 161

  readonly property int taskShowOptionAll: 0
  readonly property int taskShowOptionSelf: 1
  readonly property int taskShowOptionAllExceptSelf: 2

  readonly property int taskSortOptionByCreatorFullName:  0
  readonly property int taskSortOptionByCreationDate: 1
  readonly property int taskSortOptionByExpirationDate: 2
}
