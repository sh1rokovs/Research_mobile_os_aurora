import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    id: page
    allowedOrientations: Orientation.All

    XmlListModel {
        id: myListModel
        query: "/ValCurs/Valute"
        XmlRole {name: "Name"; query: "Name/string()"}
        XmlRole {name: "Value"; query: "Value/string()"}
    }

    SilicaListView {
        anchors.fill: parent
        header: PageHeader {
            title: "Задание №5";
            description: "Курсы валют по отношению к рублю"
        }
        model: myListModel
        delegate: Column {
            spacing: 5
            Label {text: Name ; renderType: Text.NativeRendering}
            Label {text: Value }
        }
    }

    Component.onCompleted: loadRate()
    function loadRate(){
        var xhr = new XMLHttpRequest()
        xhr.open('GET', 'https://www.cbr-xml-daily.ru/daily_utf8.xml', true)
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE){
                myListModel.xml = xhr.responseText;
            }
        }
        xhr.send();
    }
}
