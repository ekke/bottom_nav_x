// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtGraphicalEffects 1.0
import "../common"

Pane {
    id: myBar
    z: 1
    property real activeOpacity: iconOnPrimaryFolder == "black" ?  0.87 : 1.0
    property real inactiveOpacity: iconOnPrimaryFolder == "black" ? 0.54 : 0.7
    contentWidth: parent.width
    height: 56
    background: Rectangle {
        color: primaryColor
    }
    RowLayout {
        focus: false
        anchors.left: parent.left
        anchors.right: parent.right
        spacing: 0
        Repeater {
            model: navigationModel
            NavigationButton {
                id: myButton
                isColored: false
            }
        } // repeater
    } // RowLayout
} // bottomNavigationBar
