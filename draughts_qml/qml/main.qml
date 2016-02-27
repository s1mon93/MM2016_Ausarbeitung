import QtQuick 2.0
import QtQuick.Controls 1.2

import MM2016 1.0

ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 600
    height: 600
    //color: "#00000000"
    menuBar: MenuBar {
        id: menuBar
        Menu {
            title: qsTr("Game")
            MenuItem {
                id:startAction
                text: qsTr("&Start Game")
                onTriggered: {
                    console.log("Start action triggered");
                    draughtsScene.startTimer();
                }
            }
            MenuItem {
                id:pauseAction
                text: qsTr("&Pause Game")
                onTriggered: {
                    console.log("Pause action triggered");
                    draughtsScene.stopTimer();
                }
            }
            MenuItem {
                id:newAction
                text: qsTr("&New Game")
                onTriggered: {
                    console.log("New action triggered");
                    draughtsScene.stopTimer();
                    draughtsScene.newGame();
                    draughtsScene.startTimer();
                }
            }
            MenuItem {
                id: closeAction
                text: qsTr("&Exit")
                onTriggered: Qt.quit();
            }
        }
        Menu{
            title: qsTr("Debug Mode")
            MenuItem{
                id: showAxesAction
                text: qsTr("Show coordinate Axes")
                checkable: true
                onTriggered: {
                    console.log("Show axes triggered");
                    //checked = !checked
                    draughtsScene.showAxes(checked)
                }
            }
            MenuItem{
                id: showMouseRaysAction
                text: qsTr("Show Mouse Rays")
                checkable: true
                onTriggered: {
                    console.log("Show rays triggered");
                    //checked = !checked
                    draughtsScene.showMouseRays(checked)
                }
            }
        }
    }


    Rectangle{
        id: draughtsRect
        color: "black"
        anchors.fill: parent

        DraughtsScene{
            id: draughtsScene
            anchors.fill: parent
            viewportX: 0
            viewportY: 0

            //Simon
            onBlackScoreChanged:{
                text1.text = blackScore;
            }
            onWhiteScoreChanged:{
                text2.text = whiteScore;
            }
            onCurrentPlayerChanged:{
                text4.text = currentPlayer;
                if(currentPlayer === "Schwarz")
                    image3.source = "../images/blackplayer.png";
                else
                    image3.source = "../images/whiteplayer.png";
            }
            onWinnerChanged:{
                text5.text = winner;
            }

            //Ende Simon

            MouseArea{ id: sceneMouseArea
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                anchors.fill: parent
                onPressed: {
                    //console.log("Scene clicked at X: " + mouse.x + " y" + mouse.y)
                    draughtsScene.mousePressed(mouse.x + contentItem.x, mouse.y + contentItem.y);
                }
                onPositionChanged: {
                    //console.log("Mouse moved to X: " + mouse.x + " y" + mouse.y)
                    draughtsScene.mousePositionChanged(mouse.x, mouse.y);
                }
                onReleased: {
                    //console.log("Mouse released at X: " + mouse.x + " y" + mouse.y)
                    draughtsScene.mouseReleased(mouse.x, mouse.y);
                }

                Text {
                    id: text2
                    x: 166
                    y: 19
                    width: 30
                    height: 30
                    color: "#f6f6f6"
                    text: qsTr("2")
                    antialiasing: true
                    z: 0
                    font.pixelSize: 17
                }

                Image {
                    id: image1
                    x: 106
                    y: -3
                    width: 78
                    height: 73
                    antialiasing: false
                    z: 1
                    scale: 0.4
                    sourceSize.height: 385
                    sourceSize.width: 454
                    source: "../images/whiteplayer.png"
                }

                Image {
                    id: image2
                    x: 285
                    y: -1
                    width: 87
                    height: 73
                    scale: 0.4
                    sourceSize.height: 371
                    sourceSize.width: 423
                    source: "../images/blackplayer.png"
                }

                Text {
                    id: text1
                    x: 352
                    y: 20
                    width: 30
                    height: 30
                    color: "#f6f6f6"
                    text: qsTr("2")
                    z: 2
                    font.pixelSize: 17
                }

                Text {
                    id: text3
                    x: 31
                    y: 83
                    width: 89
                    height: 14
                    color: "#f6f6f6"
                    text: qsTr("Aktueller Spieler")
                    font.pixelSize: 12
                }

                Text {
                    id: text4
                    x: 31
                    y: 103
                    width: 89
                    height: 14
                    color: "#f6f6f6"
                    text: qsTr("Weiss")
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 12
                }

                Text {
                    id: text5
                    x: 190
                    y: 83
                    width: 319
                    height: 34
                    color: "#f6f6f6"
                    text: qsTr("")
                    font.pixelSize: 25
                }

                Image {
                    id: image3
                    x: 37
                    y: 101
                    width: 78
                    height: 73
                    sourceSize.height: 385
                    sourceSize.width: 454
                    antialiasing: false
                    z: 1
                    source: "../images/whiteplayer.png"
                    scale: 0.4
                }


            }


        }
    }
}
