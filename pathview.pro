# QT Modules
QT += qml quick

# Target
TARGET = pathview
TEMPLATE = app

# Sources and Headers
SOURCES += src/main.cpp

# Qml Files
OTHER_FILES += qml/*.qml

# Resources
RESOURCES += pathview.qrc

target.path = /opt/PathView
INSTALLS += target

# Objects Pathes
DESTDIR = bin
UI_DIR = build
MOC_DIR = build
RCC_DIR = build
OBJECTS_DIR = build
