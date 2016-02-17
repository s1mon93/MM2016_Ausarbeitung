import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import MM2016 1.0

DraughtsScene {
    id: mainForm
    width: 640
    height: 480

    property alias button3: button3
    property alias button2: button2
    property alias button1: button1
    property alias buttonClose: buttonClose

    Rectangle{
        id: backgroundRect
        anchors.fill: parent
        color: "black"
    }

    MouseArea{
        anchors.fill: parent
        onPressed: mainForm.mousePressed(mouse.x, mouse.y)
        onReleased: mainForm.mouseReleased(mouse.x, mouse.y)
        onPositionChanged: mainForm.mousePositionChanged(mouse.x, mouse.y)
    }


    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: buttonClose.top
        anchors.bottomMargin: 0

        Button {
            id: button1
            text: qsTr("Press Me 1")
        }

        Button {
            id: button2
            text: qsTr("Press Me 2")
        }

        Button {
            id: button3
            text: qsTr("Press Me 3")
        }
    }

    Button {
        id: buttonClose
        text: qsTr("Close")
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
    }
}
