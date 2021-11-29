import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    allowedOrientations: Orientation.All

    XmlListModel {
        id: myListModel
        source: "http://www.cbr.ru/scripts/XML_daily.asp"
        query: "/ValCurs/Valute"
        XmlRole {name: "Name"; query: "Name/string()"}
        XmlRole {name: "Value"; query: "Value/string()"}
    }

    SilicaListView {
        anchors.fill: parent
        header: PageHeader {
            title: "Задание №4";
            description: "Курсы валют по отношению к рублю"
        }
        model: myListModel
        spacing: 10
        delegate: Column {
            spacing: 5
            Label {text: Name }
            Label {text: Value }
        }
    }
}
