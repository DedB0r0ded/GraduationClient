cmake_minimum_required(VERSION 3.16)

project(QtApp VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick QuickControls2)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appQtApp
    main.cpp
)

list(APPEND PROJECT_CONSTANTS_FILES
  const/Constants.qml
  const/DefaultColorScheme.qml)

set_source_files_properties(
  ${PROJECT_CONSTANTS_FILES} PROPERTIES
  QT_QML_SINGLETON_TYPE TRUE)

qt_add_qml_module(appQtApp
    URI QtApp
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES ${PROJECT_CONSTANTS_FILES}
)

add_subdirectory(qml)
add_subdirectory(js)

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
    GQmlLibplugin
    GSourceJSLibplugin
)

include(GNUInstallDirs)
install(TARGETS appQtApp
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
