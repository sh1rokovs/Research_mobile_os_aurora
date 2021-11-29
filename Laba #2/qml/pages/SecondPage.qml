import QtQuick 2.0
import Sailfish.Silica 1.0


Dialog{
    property int summary: 0
    id:dialog;
    Column{
        anchors.fill:parent;
        id:column;
        width:parent.width;
        spacing:Theme.paddingMedium;
        Row{
            spacing:160;
            x:25;
            Label{
                text:"Число 1:"
            }
            Label{
                text:"Число 2:"
            }

        }
        Row{
            width:parent.width;
            spacing:35;
            TextField{
                id:first_num;
                width:parent.width/2-12.5;
            }
            TextField{
                id:second_num;
                width:parent.width/2-12.5;
            }
        }
        Button{
            width:parent.width;
            text:"Сложить";
            onClicked:{
                console.log(parseInt(first_num.text)+parseInt(second_num.text));
                summary = parseInt(first_num.text)+parseInt(second_num.text);
            }
        }
        TextField{
            id:summary_num;
            text: summary;
        }
    }
}

