import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column
            width: page.width
            spacing: 5

            PageHeader {
                title: "Лаба №6"
                anchors.horizontalCenter:parent.horizontalCenter
            }

            Button {
                text: "Цветные Прямоугольники"
                width: parent.width
                anchors.horizontalCenter:parent.horizontalCenter
                onClicked: pageStack.push(Qt.resolvedUrl("RectanglesColored.qml"))
            }

            Button {
                text: "Добавление прямоугольников"
                width: parent.width
                anchors.horizontalCenter:parent.horizontalCenter
                onClicked: pageStack.push(Qt.resolvedUrl("RectanglesAdd1.qml"))
            }

            Button {
                text: "Прямоугольники(JavaScript)"
                width: parent.width
                anchors.horizontalCenter:parent.horizontalCenter
                onClicked: pageStack.push(Qt.resolvedUrl("RectanglesColored1.qml"))
            }

            Button {
                text: "Курсы валют"
                width: parent.width
                anchors.horizontalCenter:parent.horizontalCenter
                onClicked: pageStack.push(Qt.resolvedUrl("ExchangeRate.qml"))
            }

            Button {
                text: "Курсы валют(XMLHttpRequest)"
                width: parent.width
                anchors.horizontalCenter:parent.horizontalCenter
                onClicked: pageStack.push(Qt.resolvedUrl("ExchangeRateXML.qml"))
            }

            Button {
                text: "Заметки"
                width: parent.width
                anchors.horizontalCenter:parent.horizontalCenter
                onClicked: pageStack.push(Qt.resolvedUrl("Notes.qml"))
            }

            Button {
                text: "Настройки"
                width: parent.width
                anchors.horizontalCenter:parent.horizontalCenter
                onClicked: pageStack.push(Qt.resolvedUrl("ConfigurationValue.qml"))
            }

            Button {
                text: "Настройки(ConfigurationGroup)"
                width: parent.width
                anchors.horizontalCenter:parent.horizontalCenter
                onClicked: pageStack.push(Qt.resolvedUrl("ConfigurationGroup.qml"))
            }
        }
    }
}

