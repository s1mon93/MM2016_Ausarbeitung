import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
    title: qsTr("Hello OpenGL in QML World")
    width: 800
    height: 800
    visible: true

    //set color to transparent, if you want to draw under QML-Items
    //color: "transparent"


    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: messageDialog.show(qsTr("Open action triggered"));
            }
            MenuItem {
                text: qsTr("E&xit")
                onTriggered: Qt.quit();
            }
        }
    }

    MainForm {
        id: mainForm
        anchors.fill: parent
        button1.onClicked: rotateScene = !rotateScene
        button1.text:(rotateScene)? qsTr("Stop"): qsTr("Start Scene Rotation")

        button2.onClicked: turnCrank = !turnCrank
        button2.text:(turnCrank)?qsTr("Stop crank"):qsTr("Turn crank")
        button3.onClicked: messageDialog.show(qsTr("Button 3 pressed"))
        buttonClose.onClicked: Qt.quit()
    }

    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }
}
