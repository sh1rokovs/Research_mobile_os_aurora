import QtQuick 2.0
import Sailfish.Silica 1.0

Button {
    default property var some_text
    property alias color_button: button.color
    id: button
    text: some_text.text
}

