cmake_minimum_required(VERSION 3.16)

project(Frius VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Core Quick QuickControls2)

qt_standard_project_setup(REQUIRES 6.5)

list(APPEND MY_CXX_SOURCES
  src/Manufacturer.h
  src/Component.h
  src/Facility.h
  src/Organisation.h
  src/User.h
  src/RegKey.h
  src/Contract.h
  src/REST_AppWrapper.cpp src/REST_AppWrapper.h
  src/AppState.h src/AppState.cpp
  src/UserState.h src/UserState.cpp
)

set(SOURCES main.cpp )
qt_add_resources(SOURCES Images.qrc)

set(app_icon_resource_windows ${CMAKE_CURRENT_SOURCE_DIR}/icon.rc)

qt_add_executable(appFrius
    ${SOURCES}
    ${MY_CXX_SOURCES}
    ${app_icon_resource_windows}
)

list(APPEND PROJECT_STRINGS
  strings/Russian.qml
)

list(APPEND PROJECT_BASIC_TYPES
  types/basic/GCanvas.qml
  types/basic/GColorSet.qml
  types/basic/GColorScheme.qml
  types/basic/GColorTriplet.qml
  types/basic/GCursor.qml
)

list(APPEND PROJECT_MODELS
  types/models/ReviewListModel.qml
  types/models/TaskShowOptionComboBoxListModel.qml
  types/models/TaskSortOptionComboBoxListModel.qml
)

list(APPEND PROJECT_VIEWS
  types/views/ContractFacilityComponentTableView.qml
  types/views/ContractMaintenanceTableView.qml
  types/views/ContractServiceTableView.qml
  types/views/ContractTableView.qml
  types/views/GlobalComponentTableView.qml
  types/views/GlobalFacilityComponentTableView.qml
  types/views/GlobalFacilityTableView.qml
  types/views/GlobalManufacturerTableView.qml
  types/views/GlobalServiceTableView.qml
  types/views/OrganisationLocalServiceTableView.qml
  types/views/OrganisationTableView.qml
  types/views/OrganisationRegKeyTableView.qml
  types/views/PrivilegeTableView.qml
  types/views/TaskTableView.qml

  types/views/ReviewListView.qml
)

list(APPEND PROJECT_TYPES
  types/GButton.qml
  types/GIconButton.qml
  types/GTextArea.qml
  types/GTextField.qml
  types/GPage.qml
  types/GLabel.qml
  types/GTextLink.qml
  types/GTableLabel.qml
  types/GGroupBox.qml
  types/GComboBox.qml
  types/GDialog.qml
)

list(APPEND PROJECT_COLOR_SCHEMES
  colorSchemes/BlueDark.qml
  colorSchemes/BlueLight.qml
)

list(APPEND PROJECT_CONFIG_FILES
  config/WindowSizes.qml
  config/DefaultColorSet.qml
  config/CurrentColorScheme.qml
  config/FontProperties.qml
  config/Controls.qml
)

list(APPEND PROJECT_JS_FILES
  js/script.js
)

list(APPEND PROJECT_PAGES
  pages/ProfilePage.qml
  pages/TasksPage.qml

  pages/OrganisationListPage.qml
  pages/OrganisationDetailsPage.qml
  pages/OrganisationLocalServicesPage.qml

  pages/ContractListPage.qml
  pages/ContractDetailsOneTimePage.qml
  pages/ContractDetailsMaintenancePage.qml
  pages/ContractServiceListPage.qml
  pages/ContractMaintenanceListPage.qml

  pages/DeveloperComponentListPage.qml
  pages/DeveloperFacilityListPage.qml
  pages/DeveloperServiceListPage.qml
  pages/DeveloperManufacturerListPage.qml
)

list(APPEND PROJECT_DIALOGS
  # dialogs/ContractFacilityDialog.qml
  # dialogs/CreateOrganisationDialog.qml
  # dialogs/FacilityReviewDialog.qml
  # dialogs/GlobalComponentDialog.qml
  # dialogs/GlobalFacilityDialog.qml
  # dialogs/GlobalServiceDialog.qml
  # dialogs/SignUpDialog.qml
  dialogs/LogInDialog.qml
  dialogs/InfoDialog.qml
)

set_source_files_properties(
  ${PROJECT_STRINGS}
  ${PROJECT_CONFIG_FILES}
  ${PROJECT_COLOR_SCHEMES}
  PROPERTIES
  QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(appFrius
    URI Frius
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES
          ${PROJECT_STRINGS}
          ${PROJECT_BASIC_TYPES}
          ${PROJECT_MODELS}
          ${PROJECT_VIEWS}
          ${PROJECT_TYPES}
          ${PROJECT_COLOR_SCHEMES}
          ${PROJECT_CONFIG_FILES}
          ${PROJECT_JS_FILES}
          ${PROJECT_PAGES}
          ${PROJECT_DIALOGS}
        RESOURCES Images.qrc
        QML_FILES UserSignUpWindow.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appFrius PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER app.example.appFrius
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appFrius
    PRIVATE Qt6::Core Qt6::Quick Qt6::QuickControls2
)

include(GNUInstallDirs)
install(TARGETS appFrius
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
