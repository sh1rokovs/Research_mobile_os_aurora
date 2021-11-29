import QtQuick 2.0
import Sailfish.Silica 1.0
import "C:\Users\Sid\lab_7\qml\pages\CustomButton.qml"

Page {
    id: page
    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column
            width: page.width

            PageHeader { title: "Пятое задание" }

            CustomButton {
                anchors.horizontalCenter: parent.horizontalCenter
                color_button: "white"

                Text { text: "Custom Button" }
            }
        }
    }
}
