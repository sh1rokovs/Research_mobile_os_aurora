import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    allowedOrientations: Orientation.All

    ListModel {
        id: myListModel
        ListElement {myColor: "black"; myText: "Черный"; myTexColor: "white"}
        ListElement {myColor: "red"; myText: "Красный"; myTexColor: "black"}
        ListElement {myColor: "orange"; myText: "Оранжевый"; myTexColor: "black"}
    }

    SilicaListView {
        anchors.fill: parent
        model: myListModel
        header: PageHeader {
            title: "Задание 1";
            description: "Цветные прямоугольники"
        }
        spacing: 5
        delegate: Rectangle {
            width: parent.width
            height: 100
            color: model.myColor
            Text {
                anchors.centerIn: parent
                text: model.myText
                color: model.myTexColor
            }
        }
    }
}
