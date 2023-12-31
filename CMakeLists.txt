cmake_minimum_required(VERSION 3.16)

project(ChartTest VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick Charts QuickControls2
                3DCore 3DExtras 3DRender 3DInput)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appChartTest
    res.qrc
    src/main.cpp
    src/livesinus.h src/livesinus.cpp
    src/sinustable.h src/sinustable.cpp
)

qt_add_qml_module(appChartTest
    URI ChartTest
    VERSION 1.0
    QML_FILES src/qml/Main.qml
    QML_FILES src/qml/SinusWindow.qml
    QML_FILES src/qml/ColoredImage.qml
    QML_FILES src/qml/BarChartWindow.qml
    QML_FILES src/qml/ZoomWindow.qml
    QML_FILES src/qml/DotsWindow.qml
    QML_FILES src/qml/SphereWindow.qml
)

target_include_directories(appChartTest PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/src)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appChartTest PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appChartTest
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

add_subdirectory(CustomStyle)

target_link_libraries(appChartTest
    PRIVATE Qt6::Quick Qt6::Charts
    Qt6::QuickControls2 Qt6::3DCore
    Qt6::3DExtras Qt6::3DRender
    Qt6::3DInput custom_style_moduleplugin
)

include(GNUInstallDirs)
install(TARGETS appChartTest
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
