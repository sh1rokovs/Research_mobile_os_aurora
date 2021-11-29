import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    allowedOrientations: Orientation.All

    SilicaListView {
        anchors.fill: parent
        header: PageHeader { title: "Меню" }
        model: ListModel {
            id: listModel
            Component.onCompleted: {
                append({"name": "Светофор"});
                append({"name": "Светофор и человек"});
                append({"name": "Подвижный текст"});
                append({"name": "Светофор-компомнент"});
                append({"name": "Текст с кнопкой"});
                append({"name": "Секундомер"});
                append({"name": "PageStack"});
            }
        }
        delegate: ListItem {
            width: ListView.view.width
            contentHeight: label_name.height + label_description.height

            Label {
                id: label_name
                text: model.name
                font.pixelSize: 48
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label {
                id: label_description
                text: model.description
                font.pixelSize: 36
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: label_name.bottom
            }

            onClicked: {
                var idx = parseInt(index) + 1;
                pageStack.push(Qt.resolvedUrl("Page" + idx.toString() + ".qml"));
            }
        }
    }
}

