import QtQuick 2.0
import QtQuick.Controls 1.2


import MM2016 1.0

ApplicationWindow {
    id: applicationWindow
    visible: true
     width: 600
     height: 600
//     color: "#00000000"
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
             MouseArea{ id: sceneMouseArea
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
             }
         }
    }

}
