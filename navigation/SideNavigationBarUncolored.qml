// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../common"

Pane {
    id: myBar
    z: 1
    leftPadding: 0
    property real activeOpacity: iconFolder == "black" ?  0.87 : 1.0
    property real inactiveOpacity: iconFolder == "black" ? 0.26 : 0.56
    width: 80 + myBarDivider.width
    height: appWindow.height
    property int titleHeight: hideTitleBar? 0 : 48
    property int buttonHeight: (appWindow.height - titleHeight) / navigationModel.length
    ColumnLayout {
        id: myButtons
        focus: false
        anchors.left: parent.left
        anchors.right: parent.right
        spacing: 0
        Item {
            // empty space on top where floating titlebar can be or not
            height: titleHeight
        }
        Repeater {
            model: navigationModel
            NavigationButton {
                id: myButton
                isColored: true
                height: buttonHeight
                implicitHeight: buttonHeight
                width: 80
                Layout.fillHeight: true
            }
        } // repeater
    } // ColumnLayout
    VerticalDivider{
        id: myBarDivider
        anchors.left: myButtons.right
    }
} // sideNavigationBar
