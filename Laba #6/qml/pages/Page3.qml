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

            PageHeader { title: "Третье задание" }

            Label {
                id: label
                text: "Подвижный текст"
                color: "white"
                font.pixelSize: 64
                anchors.horizontalCenter: parent.horizontalCenter
                state: "normal"
                states: [

                    State {
                        name: "normal"

                        PropertyChanges {
                            target: label
                            y: 100
                        }

                        PropertyChanges {
                            target: label
                            color: "black"
                        }

                        PropertyChanges {
                            target: label
                            rotation: 0
                        }
                    },

                    State {
                        name: "inverted"

                        PropertyChanges {
                            target: label
                            y: 500
                        }

                        PropertyChanges {
                            target: label
                            color: "black"
                        }

                        PropertyChanges {
                            target: label
                            rotation: 180
                        }
                    }
                ]
                transitions: [

                    Transition {

                        NumberAnimation {
                            property: "y"
                            duration: 3000
                        }

                        RotationAnimation {
                            direction: RotationAnimation.Counterclockwise
                            duration: 3000
                        }

                        ColorAnimation {
                            duration: 3000
                        }
                    }
                ]

                MouseArea {
                    anchors.fill: parent
                    onPressed: label.state = (label.state == "normal") ? "inverted" : "normal"
                    onReleased: label.state = (label.state == "normal") ? "inverted" : "normal"
                }
            }
        }
    }
}

