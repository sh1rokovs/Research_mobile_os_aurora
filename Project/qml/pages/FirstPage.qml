import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.sapper.saperfield 1.0

Page {
    id: page

    property int fieldsize: 10
    property bool isgenerated: false
    property int chance: 5;
    property bool lock: false;
    property bool flag: false;

    SaperField {
        id: saperfield
        size: fieldsize
    }

    Label {
        id: titlelabel
        text: 'Игра "Сапёр"'
        anchors.horizontalCenter: parent.horizontalCenter
        y: 10
        font.pixelSize: 60
    }

    ListModel {
        id: listmodel
        dynamicRoles: true
        Component.onCompleted: {
                for (var i = 0; i < 100; i++) {
                   append({"text": '', "color": 'grey'});
                }
            }
    }

    Button {
        text: "Заново"
        y: 100
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            isgenerated = false
            lock = false
            lose.visible = false
            win.visible = false
            saperfield.setSize(10)
            for (var i = 0; i < 100; i++) {
                listmodel.get(i).text = ''
                listmodel.get(i).color = 'grey'
            }
        }
    }

    Button {
        text: "X"
        y: 1000
        width: 100
        height: 100
        color: 'black'
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            if(flag) {
                flag = false
                text = 'X'
                color = 'black'
            } else {
                flag = true
                text = 'P'
                color = 'red'
            }
        }
    }

    GridView {
        id: grid
        width: 600
        height: 600
        anchors.centerIn: parent
        anchors.margins: 20

        model: listmodel

        cellWidth: grid.width/fieldsize
        cellHeight: grid.height/fieldsize

        delegate: numberDelegate
    }

    Rectangle {
            width: 600
            height: 200
            anchors.centerIn: parent
            visible: false
            id: lose
            color: 'red'
            Text {
                anchors.centerIn: parent
                id: textlose
                text: "You losed"
            }
            MouseArea {
                anchors.fill: parent
                onClicked:{
                    lose.visible = false
                }
            }
    }

    Rectangle {
            width: 600
            height: 200
            anchors.centerIn: parent
            visible: false
            id: win
            color: 'green'
            Text {
                anchors.centerIn: parent
                id: textwin
                text: "You won"
            }
            MouseArea {
                anchors.fill: parent
                onClicked:{
                    win.visible = false
                }
            }
    }

    Component {
        id: numberDelegate

        Rectangle {
            id: rectangle
            width: grid.cellWidth
            height: grid.cellHeight
            property int cord_x: index%fieldsize + 1
            property int cord_y: index/fieldsize + 1
            color: model.color
            border.color: 'black'
            border.width: 2
            Label {
                id: text
                anchors.centerIn: parent
                color: 'black'
                text: model.text//saperfield.getCell(cord_x, cord_y)
            }
            MouseArea {
                anchors.fill: parent
                onClicked:{
                    if(!lock) {
                        if(page.isgenerated == false) {
                            saperfield.randomFullfil(cord_x, cord_y, page.chance)
                            page.isgenerated = true;
                        }
                        if(!flag) {
                            var res = saperfield.openCell(cord_x, cord_y)
                            if(res === 1) {
                                win.visible = true
                                lock = true
                            } else if (res === 2) {
                                lose.visible = true
                                lock = true
                            }
                        } else {
                            saperfield.setFlag(cord_x, cord_y)
                        }
                        for (var i = 0; i < 100; i++) {
                            var ret_code = saperfield.getCell(i%fieldsize + 1, i/fieldsize + 1)
                            if(!(ret_code & 2)) {
                                if(ret_code & 1) {
                                    listmodel.get(i).color = 'red'
                                    listmodel.get(i).text = "X"
                                 } else {
                                     var num = (saperfield.getCell(i%fieldsize + 1, i/fieldsize + 1) & 120) >> 4
                                     listmodel.get(i).color = 'white'
                                     if(num)
                                        listmodel.get(i).text = num
                                }
                            } else if(ret_code & 4) {
                                listmodel.get(i).text = 'P'
                                listmodel.get(i).color = 'red'
                            } else {
                                listmodel.get(i).text = ''
                                listmodel.get(i).color = 'grey'
                            }
                        }
                    }
                }
            }
        }
    }
}
