cmake_minimum_required(VERSION 3.16)

project(QtApp VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick QuickControls2)

qt_standard_project_setup(REQUIRES 6.5)

list(APPEND REST_CLIENT_SOURCES
  REST_AppWrapper.cpp REST_AppWrapper.h
)

set(SOURCES main.cpp)
qt_add_resources(SOURCES Images.qrc)

set(app_icon_resource_windows ${CMAKE_CURRENT_SOURCE_DIR}/icon.rc)

qt_add_executable(appQtApp
    ${SOURCES}
    ${REST_CLIENT_SOURCES}
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
  types/models/ContractFacilityComponentTableModel.qml
  types/models/ContractMaintenanceTableModel.qml
  types/models/ContractServiceTableModel.qml
  types/models/ContractTableModel.qml
  types/models/GlobalBankTableModel.qml
  types/models/GlobalComponentTableModel.qml
  types/models/GlobalFacilityComponentTableModel.qml
  types/models/GlobalFacilityTableModel.qml
  types/models/GlobalManufacturerTableModel.qml
  types/models/GlobalServiceTableModel.qml
  types/models/LocalServiceTableModel.qml
  types/models/OrganisationTableModel.qml
  types/models/PrivilegeTableModel.qml
  types/models/RegKeyTableModel.qml
  types/models/TaskTableModel.qml

  types/models/ReviewListModel.qml
)

list(APPEND PROJECT_TYPES
  types/GButtonTemplate.qml
  types/GButton.qml
  types/GIconButton.qml
  types/GTextArea.qml
  types/GTextField.qml
  types/GPage.qml
  types/GLabel.qml
  types/GGroupBox.qml
  types/GComboBox.qml
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

  pages/DeveloperBankListPage.qml
  pages/DeveloperComponentListPage.qml
  pages/DeveloperFacilityListPage.qml
  pages/DeveloperServiceListPage.qml
  pages/DeveloperManufacturerListPage.qml
)

list(APPEND PROJECT_WINDOWS

)

set_source_files_properties(
  ${PROJECT_STRINGS}
  ${PROJECT_CONFIG_FILES}
  ${PROJECT_COLOR_SCHEMES}
  #${PROJECT_PAGES}
  #${PROJECT_WINDOWS}
  PROPERTIES
  QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(appQtApp
    URI QtApp
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES ${PROJECT_STRINGS}
        QML_FILES ${PROJECT_BASIC_TYPES}
        #QML_FILES ${PROJECT_MODELS}
        QML_FILES ${PROJECT_TYPES}
        QML_FILES ${PROJECT_COLOR_SCHEMES}
        QML_FILES ${PROJECT_CONFIG_FILES}
        QML_FILES ${PROJECT_JS_FILES}
        QML_FILES ${PROJECT_PAGES}
        QML_FILES ${PROJECT_WINDOWS}
        RESOURCES Images.qrc
        QML_FILES UserSignUpWindow.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appQtApp PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appQtApp
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appQtApp
    PRIVATE Qt6::Quick Qt6::QuickControls2
)

include(GNUInstallDirs)
install(TARGETS appQtApp
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
