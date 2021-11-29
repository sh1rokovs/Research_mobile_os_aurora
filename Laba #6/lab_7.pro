# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = lab_7

CONFIG += sailfishapp

SOURCES += src/lab_7.cpp

DISTFILES += qml/lab_7.qml \
    qml/cover/CoverPage.qml \
    qml/pages/CustomButton.qml \
    qml/pages/FirstPage.qml \
    qml/pages/Page1.qml \
    qml/pages/Page2.qml \
    qml/pages/Page3.qml \
    qml/pages/Page4.qml \
    qml/pages/Page5.qml \
    qml/pages/Page6.qml \
    qml/pages/Page7.qml \
    qml/pages/SecondPage.qml \
    qml/pages/TrafficLight.qml \
    rpm/lab_7.changes.in \
    rpm/lab_7.changes.run.in \
    rpm/lab_7.spec \
    rpm/lab_7.yaml \
    translations/*.ts \
    lab_7.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/lab_7-de.ts
