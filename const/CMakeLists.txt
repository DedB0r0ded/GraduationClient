set(MODULE_NAME GConst)
set(LIB_NAME ${MODULE_NAME}Lib)

qt_add_library(${LIB_NAME} STATIC)

set_target_properties(${LIB_NAME} PROPERTIES AUTOMOC ON)
target_link_libraries(${LIB_NAME} PRIVATE Qt6::Quick)

list(APPEND G_CONST_FILES Constants.qml)

set_source_files_properties(${G_CONST_FILES} PROPERTIES
  QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(${LIB_NAME}
  URI ${MODULE_NAME}
  VERSION 0.1
  RESOURCE_PREFIX /
  QML_FILES ${G_CONST_FILES}
)
