// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.0
import "../common"

Pane {
    id: myBar
    property bool suppressInactiveLabels: bottomNavigationModel.length > 3
    property int currentIndex: 0
    property real activeOpacity: iconOnPrimaryFolder == "black" ?  0.87 : 1.0
    property real inactiveOpacity: iconOnPrimaryFolder == "black" ? 0.54 : 0.7
    property int activeFontSize: 14
    property int inactiveFontSize: 12
    onCurrentIndexChanged: {
        rootPane.activeDestination(currentIndex)
    }
    height: 56
    anchors.left: parent.left
    anchors.right: parent.right
    background: Rectangle {
        color: primaryColor
    }
    RowLayout {
        focus: false
        anchors.left: parent.left
        anchors.right: parent.right
        spacing: 0
        Repeater {
            model: bottomNavigationModel
            NavigationButton {
                id: myButton
                isColored: false
            }
        } // repeater

    } // RowLayout

} // bottomNavigationBar
