// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.0
import "../common"

Pane {
    id: myBar
    property bool suppressInactiveLabels: navigationModel.length > 3
    property real activeOpacity: iconOnPrimaryFolder == "black" ?  0.87 : 1.0
    property real inactiveOpacity: iconOnPrimaryFolder == "black" ? 0.54 : 0.7
    property int activeFontSize: 14
    property int inactiveFontSize: 12
    width: 80
    height: appWindow.height
    property int buttonHeight: (appWindow.height - 48) / navigationModel.length
    //anchors.top: parent.top
    //anchors.bottom: parent.bottom
    background: Rectangle {
        color: primaryColor
    }
    ColumnLayout {
        focus: false
        anchors.left: parent.left
        anchors.right: parent.right
        spacing: 0
        Item {
            // empty space on top where floating titlebar can be or not
            height: 48
        }
        Repeater {
            model: navigationModel
            NavigationButton {
                id: myButton
                isColored: false
                height: buttonHeight
                implicitHeight: buttonHeight
                width: 80
                Layout.fillHeight: true
            }
        } // repeater
    } // ColumnLayout
} // sideNavigationBar
