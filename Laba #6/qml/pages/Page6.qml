import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent

        Column {
            id: column
            width: page.width

            PageHeader { title: "Шестое задание" }

            Timer {
                id: timer
                property var ticks: 0
                interval: 1000
                repeat: true
                onTriggered: time.text = dispaly_time(++ticks);
            }

            Text {
                id: time
                text: dispaly_time(timer.ticks)
                font.pixelSize: 46
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Button {
                id: button
                anchors.horizontalCenter: parent.horizontalCenter
                text: timer.running ? "Стоп" : "Старт"
                onClicked: {
                    timer.running ? timer.stop() : timer.start();
                }
            }
        }
    }

    function dispaly_time(ticks) {
        var hh = Math.floor(ticks / 3600);
        var mm = Math.floor((ticks % 3600) / 60);
        var ss = ticks % 60
        return pad(hh, 2) + ":" + pad(mm, 2) + ":" + pad(ss, 2);
    }

    function pad(n, width) {
        n = n + "";
        return n.length >= width ? n : new Array(width - n.length + 1).join("0") + n;
    }
}

