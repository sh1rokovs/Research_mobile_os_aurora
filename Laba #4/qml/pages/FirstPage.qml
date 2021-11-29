import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 2")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge

            TextField {
                id: numberTextField;
                width: parent.width;
                label: "Введите число"
                placeholderText: label
                inputMethodHints: Qt.ImhFormattedNumbersOnly;
            }

            Button {
                id: pressedButton;
                anchors.horizontalCenter: parent.horizontalCenter;
                text: "Нажмите!"
                onClicked: {
                    pressedButton.color = "red";
                    pressedButton.text = "Нажали!";
                }
            }

            Label {
                id: holdLabel;
                anchors.horizontalCenter: parent.horizontalCenter;
                text: "Не нажали"
            }

            Button {
                id: holdButton;
                anchors.horizontalCenter: parent.horizontalCenter;
                highlightBackgroundColor: "blue"
                text: "Кнопка"
                onPressedButtonsChanged: {
                    if(down)
                        holdLabel.text = "Нажали"
                    else
                        holdLabel.text = "Не нажали"
                }
            }

            ValueButton {
                width: parent.width;
                property int count: 0
                label: "Счетчик: "
                description: "Считает количество нажатий"
                value: count;
                onClicked: count++;
            }

            DatePicker {
                date: new Date(2020, 10, 31, 12, 0, 0);
                daysVisible: true
                weeksVisible: true
                monthYearVisible: true
                onDateTextChanged:
                    console.log(dateText);
            }

            Item {
                height: timePicker.height;
                width: parent.width;
                TimePicker {
                    width: parent.width
                    id: timePicker;
                    hour: 15
                    minute: 30
                    onTimeTextChanged: console.log(timeText)
                }
                Label {
                    anchors.centerIn: timePicker;
                    text: timePicker.timeText
                    font.pixelSize: Theme.fontSizeExtraLarge
                }

            }

            ComboBox {
                anchors.horizontalCenter: parent.horizontalCenter;
                label: "Любимая машина:"
                menu: ContextMenu {
                    id: menu
                    MenuItem { text: "BMW" }
                    MenuItem { text: "Audi" }
                    MenuItem { text: "Жигули" }
                }
                onCurrentIndexChanged: console.log(menu.children[currentIndex].text)
            }

            Switch {
                anchors.horizontalCenter: parent.horizontalCenter;
                id: mute;
                iconSource: "image://theme/icon-m-mic-mute?"
                            + (checked ? Theme.highlightColor : Theme.primaryColor);
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: mute.checked?"Включен":"Выключен";
            }

            Slider {
                width: parent.width
                label: "Текущее значение = " + value;
                minimumValue: -50   ;
                maximumValue: 50;
                value: 0;
                stepSize: 1;
            }

            Rectangle {
                color: "transparent"
                width: parent.width;
                height: 100;
            }
        }
    }
}

