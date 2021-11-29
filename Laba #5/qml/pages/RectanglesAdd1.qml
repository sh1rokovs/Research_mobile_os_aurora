import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    allowedOrientations: Orientation.All

    ListModel {
        id: myListModel
    }

    Column {
        id: myColumn
        property int myCount: 0
        width: page.width
        spacing: 10

        PageHeader {
            title: "Задание №2";
            description: "Добавление прямоугольников"
        }

        Button {
            id: myButton
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Добавить прямоугольник"
            onClicked: myListModel.append({myText: "Прямоугольник №" + (++myColumn.myCount)})
        }

        SilicaListView {
            height: parent.height
            width: parent.width
            model: myListModel
            spacing: 10
            delegate: Rectangle {
                width: parent.width
                height: 70
                color: "orange"
                Text {
                    anchors.centerIn: parent
                    text: model.myText
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {myListModel.remove(model.index,1)}
                }
            }
        }
    }
}
