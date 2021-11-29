import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    allowedOrientations: Orientation.All
    property int count_pages_pushed: 10
    property int count_pages_poped: 10

    SilicaFlickable {
        anchors.fill: parent

        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge

            PageHeader { title: "Седьмое задание" }

            Label {
                id: label_count_pushed
                text: "Кол-во добавленных страниц: " + count_pages_pushed
            }

            Label {
                id: label_count_poped
                text: "Кол-во удаленных страниц: " + count_pages_poped
            }
        }
    }
}

