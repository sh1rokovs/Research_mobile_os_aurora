import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    allowedOrientations: Orientation.All
    property int size: 240
    Component.onCompleted: change_state()

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column
            width: page.width

            PageHeader { title: "Второе задание" }

            Rectangle {
                id: traffic_light
                color: "darkslategray"
                width: size + 30
                height: 3 * size + 60
                anchors.horizontalCenter: parent.horizontalCenter
                state: "red_lights"

                Column {
                    anchors.centerIn: parent
                    spacing: 15

                    Rectangle {
                        id: red_light
                        width: size
                        height: size
                        radius: size
                        color: "black"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Rectangle {
                        id: yellow_light
                        width: size
                        height: size
                        radius: size
                        color: "black"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Rectangle {
                        id: green_light
                        width: size
                        height: size
                        radius: size
                        color: "black"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                states: [

                    State {
                        name: "red_lights"

                        PropertyChanges {
                            target: red_light
                            color: "red"
                        }
                    },

                    State {
                        name: "switch_to_green"

                        PropertyChanges {
                            target: red_light
                            color: "red"
                        }

                        PropertyChanges {
                            target: yellow_light
                            color: "yellow"
                        }
                    },

                    State {
                        name: "yellow_lights"

                        PropertyChanges {
                            target: yellow_light
                            color: "yellow"
                        }
                    },

                    State {
                        name: "green_lights"

                        PropertyChanges {
                            target: green_light
                            color: "green"
                        }
                    }
                ]
                transitions: [

                    Transition {
                        from: "red_lights"
                        to: "switch_to_green"

                        SequentialAnimation {

                            PauseAnimation {
                                duration: 3000
                            }

                            ColorAnimation {
                                targets: [red_light, yellow_light, green_light]
                                property: "color"
                                duration: 0
                            }

                            ScriptAction {
                                script: change_state()
                            }
                        }
                    },

                    Transition {
                        from: "switch_to_green"
                        to: "green_lights"

                        SequentialAnimation {

                            PauseAnimation {
                                duration: 1000
                            }

                            ColorAnimation {
                                targets: [red_light, yellow_light, green_light]
                                property: "color"
                                duration: 0
                            }

                            ScriptAction {
                                script: change_state()
                            }
                        }
                    },

                    Transition {
                        from: "green_lights"
                        to: "yellow_lights"

                        SequentialAnimation {

                            PauseAnimation {
                                duration: 3000
                            }

                            ColorAnimation {
                                target: green_light
                                property: "color"
                                to: "black"
                                duration: 0
                            }

                            PauseAnimation {
                                duration: 500
                            }

                            ColorAnimation {
                                target: green_light
                                property: "color"
                                to: "green"
                                duration: 0
                            }

                            PauseAnimation {
                                duration: 500
                            }

                            ColorAnimation {
                                target: green_light
                                property: "color"
                                to: "black"
                                duration: 0
                            }

                            PauseAnimation {
                                duration: 500
                            }

                            ColorAnimation {
                                target: green_light
                                property: "color"
                                to: "green"
                                duration: 0
                            }

                            PauseAnimation {
                                duration: 500
                            }

                            ColorAnimation {
                                target: green_light
                                property: "color"
                                to: "black"
                                duration: 0
                            }

                            PauseAnimation {
                                duration: 500
                            }

                            ColorAnimation {
                                target: green_light
                                property: "color"
                                to: "green"
                                duration: 0
                            }

                            PauseAnimation {
                                duration: 500
                            }

                            ColorAnimation {
                                target: green_light
                                property: "color"
                                to: "black"
                                duration: 0
                            }

                            ColorAnimation {
                                targets: [red_light, yellow_light, green_light]
                                property: "color"
                                duration: 0
                            }

                            ScriptAction {
                                script: change_state()
                            }
                        }
                    },

                    Transition {
                        from: "yellow_lights"
                        to: "red_lights"

                        SequentialAnimation {

                            PauseAnimation {
                                duration: 1000
                            }

                            ColorAnimation {
                                targets: [red_light, yellow_light, green_light]
                                property: "color"
                                duration: 0
                            }

                            ScriptAction {
                                script: change_state()
                            }
                        }
                    }
                ]
            }

            Image {
                id: image_person
                source: "image://theme/icon-m-person"
                state: "one_side"
                states: [

                    State {
                        name: "one_side"

                        PropertyChanges {
                            target: image_person
                            x: 10
                        }
                    },

                    State {
                        name: "other_side"

                        PropertyChanges {
                            target: image_person
                            x: parent.width - 100
                        }
                    }
                ]
                transitions: [

                    Transition {

                        NumberAnimation {
                            property: "x"
                            duration: 3000
                        }
                    }
                ]
            }
        }
    }
    function change_state() {
        switch(traffic_light.state) {
            case "red_lights":
                traffic_light.state = "switch_to_green";
            break;
            case "switch_to_green":
                traffic_light.state = "green_lights";
            break;
            case "green_lights":
                image_person.state = (image_person.state == "one_side") ? "other_side" : "one_side";
                traffic_light.state = "yellow_lights";
            break;
            case "yellow_lights":
                traffic_light.state = "red_lights";
            break;
        }
    }
}

