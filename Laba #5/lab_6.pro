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
TARGET = lab_6

CONFIG += sailfishapp

SOURCES += src/lab_6.cpp

DISTFILES += qml/lab_6.qml \
    qml/cover/CoverPage.qml \
    qml/pages/ConfigurationGroup.qml \
    qml/pages/ConfigurationValue.qml \
    qml/pages/Dao.qml \
    qml/pages/ExchangeRate.qml \
    qml/pages/ExchangeRateXML.qml \
    qml/pages/FirstPage.qml \
    qml/pages/Notes.qml \
    qml/pages/RectanglesAdd1.qml \
    qml/pages/RectanglesColored.qml \
    qml/pages/RectanglesColored1.qml \
    qml/pages/SecondPage.qml \
    rpm/lab_6.changes.in \
    rpm/lab_6.changes.run.in \
    rpm/lab_6.spec \
    rpm/lab_6.yaml \
    translations/*.ts \
    lab_6.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/lab_6-de.ts
