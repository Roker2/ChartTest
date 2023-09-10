qt_add_library(custom_style_module STATIC)
find_package(Qt6 6.5 REQUIRED COMPONENTS Quick QuickControls2)
qt_add_qml_module(custom_style_module
    URI "CustomStyle"
    VERSION 1.0
    QML_FILES CustomTabButton.qml
    QML_FILES RectangleGradient.qml
)
target_link_libraries(custom_style_module
    PRIVATE Qt6::Quick Qt6::QuickControls2
)
