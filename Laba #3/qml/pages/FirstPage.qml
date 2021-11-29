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
                width: parent.width;
                anchors.horizontalCenter: parent.horizontalCenter;
                text: "Нажми меня!"
                onClicked: {
                    pressedButton.color = "red";
                    pressedButton.text = "Уже нажали";
                }
            }

            Label {
                id: holdLabel;
                anchors.horizontalCenter: parent.horizontalCenter;
                text: "Не нажал!"
            }

            Button {
                id: holdButton;
                anchors.horizontalCenter: parent.horizontalCenter;
                width: parent.width;
                highlightBackgroundColor: "blue"
                text: "Щелкни!"
                onPressedButtonsChanged: {
                    if(down)
                        holdLabel.text = "Нажал!"
                    else
                        holdLabel.text = "Не нажал!"
                }
            }

            ValueButton {
                width: parent.width;
                property int count: 0
                label: "Количество нажатий: "
                description: "Счетчик нажатий."
                value: count;
                onClicked: count++;
            }

            DatePicker {
                date: new Date(2021, 11, 23, 12, 0, 0);
                daysVisible: true
                weeksVisible: true
                monthYearVisible: true
                onDateTextChanged:
                    console.log(dateText);
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter;
                text: "Задайте будильник";
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
            Button {
                width: parent.width;
                highlightBackgroundColor: "grey";
                text: "Задать"
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter;
                text: "Выберите опцию:";
            }

            ComboBox {
                anchors.horizontalCenter: parent.horizontalCenter;
                label: "Цвет:"
                menu: ContextMenu {
                    id: menu
                    MenuItem { text: "Желтый" }
                    MenuItem { text: "Синий" }
                    MenuItem { text: "Красный" }
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
                anchors.horizontalCenter: parent.horizontalCenter;
                text: mute.checked?"      Звук\nВыключен":"    Звук\nВключен";
            }

            Label {
                id: soundTextField;
                width: parent.width;
                anchors.horizontalCenter: parent.horizontalCenter;
                text: "Громкость";
            }

            Slider {
                width: parent.width
                label: "Текущее значение = " + value;
                minimumValue:0;
                maximumValue:30;
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

