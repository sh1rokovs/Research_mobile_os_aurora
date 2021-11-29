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
                text: qsTr("Показать второе окно")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column{
            id:column
            width:page.width

            spacing:Theme.paddingLarge

            Rectangle{
                width:100
                height:100*2.4
                color:"transparent"
                Rectangle{
                    width:100
                    height:100
                    x:50
                    y:50
                    color:"red"
                    Rectangle{
                        width:100
                        height:100
                        x:100
                        y:50
                        color:"green"
                        Rectangle{
                            id:blueRect
                            width:100
                            height:100
                            x:50
                            y:-50
                            color:"blue"
                            Text{
                                text:"Квадрат"
                                color:"white"
                                anchors.centerIn:blueRect
                            }
                        }
                    }
                }
            }

            //2 exercise
            Rectangle{
                width:parent.width
                height:500
                color:"transparent"

                Row{
                    anchors.horizontalCenter:parent.horizontalCenter
                    anchors.verticalCenter:parent.verticalCenter
                    spacing:100/6;

                    Rectangle{
                        width:100;
                        height:100
                        color:"red"
                    }
                    Rectangle{
                        width:100;
                        height:100
                        color:"green"
                    }
                    Rectangle{
                        width:100;
                        height:100
                        color:"blue"
                    }
                }
            }

            Rectangle{
                width:parent.width
                height:100+100/12
                color:"transparent"

                Row{
                    anchors.horizontalCenter:parent.horizontalCenter
                    anchors.verticalCenter:parent.verticalCenter
                    spacing:100/6;

                    Rectangle{
                        width:100;
                        height:100
                        color:"pink"
                    }
                    Rectangle{
                        width:100;
                        height:100
                        color:"transparent"
                    }
                    Rectangle{
                        width:100;
                        height:100
                        color:"black"
                    }
                }
            }

            //3 exercise
            Rectangle{
                width:parent.width
                height:100*2+100/6
                color:"transparent"

                Grid{
                    anchors.horizontalCenter:parent.horizontalCenter
                    anchors.verticalCenter:parent.verticalCenter
                    columns:3
                    rows:2
                    spacing:100/6
                    Rectangle{
                        width:100;
                        height:100
                        color:"red"
                    }
                    Rectangle{
                        width:100;
                        height:100
                        color:"green"
                    }
                    Rectangle{
                        width:100;
                        height:100
                        color:"blue"
                    }
                    Rectangle{
                        width:100;
                        height:100
                        color:"pink"
                    }
                    Rectangle{
                        width:100;
                        height:100
                        color:"transparent"
                    }
                    Rectangle{
                        width:100;
                        height:100
                        color:"black"
                    }

                }
            }

            //4 exercise
            Rectangle{
                width:parent.width
                height:100*1.5
                color:"transparent"
                Rectangle{
                    id:startRect
                    width:100*1.5
                    height:100*1.5
                    x:width/18
                    y:height/18
                    color:"black"
                    Rectangle{
                        width:parent.width
                        height:parent.height
                        color:parent.color
                        z:1
                        transform:[Scale{xScale:0.5;yScale:1},Rotation{angle:45},Translate{x:100*2.8}]
                    }
                }
            }

            //5 exercise
            Rectangle{
                width:parent.width
                height:150*4;
                color:"transparent"
                Rectangle{
                    id:orangeBox;
                    y:50;
                    anchors.horizontalCenter:parent.horizontalCenter;
                    width:10;
                    height:10;
                    color:"black";
                    SequentialAnimation{
                        loops:Animation.Infinite;
                        id:animation;
                        running:true
                        ParallelAnimation{
                            PropertyAnimation{
                                target:orangeBox;
                                property:"y";
                                from:50;to:page.width-100-25;duration:2000;
                            }
                            PropertyAnimation{
                                target:orangeBox;
                                property:"width";
                                from:0;to:100;duration:2000;
                            }
                            PropertyAnimation{
                                target:orangeBox;
                                property:"height";
                                from:0;to:100;duration:2000;
                            }
                        }
                        ParallelAnimation{
                            PropertyAnimation{
                                target:orangeBox;
                                property:"y";
                                from:parent.width-100-50;to:50;duration:2000;

                            }
                            PropertyAnimation{
                                target:orangeBox;
                                property:"width";
                                from:100;to:0;duration:2000;
                            }
                            PropertyAnimation{
                                target:orangeBox;
                                property:"height";
                                from:100;to:0;duration:2000;
                            }
                        }
                    }
                }
            }
        }
    }
}

