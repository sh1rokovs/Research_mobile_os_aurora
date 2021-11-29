import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    allowedOrientations: Orientation.All
    property var myModel: [
        {myColor: "Black", myText: "Черный", myTexColor: "White"},
        {myColor: "Red", myText: "Красный", myTexColor: "Black"},
        {myColor: "Orange", myText: "Оранжевый", myTexColor: "Black"}
    ]

    SilicaListView{
        anchors.fill: parent
        model: myModel
        header: PageHeader {
            title: "Задание 3";
            description: "javascript - прямоугольники"
        }
        delegate: Rectangle {
            width: parent.width
            height: 100
            color: modelData.myColor
            Text {
                anchors.centerIn: parent
                text: modelData.myText
                color: modelData.myTexColor
            }
        }
    }
}
