// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtGraphicalEffects 1.0
import "../common"

ToolButton {
    id: myButton
    // as default this Button is uncolored and loves inside a color Bar
    property bool isColored: false
    property bool isActive: index == navigationIndex
    property string myIconFolder: isColored? iconFolder : iconOnPrimaryFolder
    Layout.alignment: Qt.AlignHCenter
    focusPolicy: Qt.NoFocus
    implicitHeight: 56
    implicitWidth: (myBar.width - 12) / navigationModel.length
    Column {
        spacing: 0
        topPadding: myButton.isActive || !suppressInactiveLabels? 0 : 6
        anchors.horizontalCenter: parent.horizontalCenter
        Item {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 24
            height: 24
            Image {
                id: contentImage
                width: 24
                height: 24
                verticalAlignment: Image.AlignTop
                anchors.horizontalCenter: parent.horizontalCenter
                source: "qrc:/images/"+myIconFolder+"/"+modelData.icon
                opacity: isActive? myBar.activeOpacity : myBar.inactiveOpacity
            }
            ColorOverlay {
                id: colorOverlay
                visible: myButton.isColored && myButton.isActive
                anchors.fill: contentImage
                source: contentImage
                color: primaryColor
            }
        } // image and coloroverlay
        Label {
            visible: myButton.isActive || !suppressInactiveLabels
            anchors.horizontalCenter: parent.horizontalCenter
            text: modelData.name
            opacity: isColored? (isActive? 1.0 : 0.7) : (isActive? myBar.activeOpacity : myBar.inactiveOpacity)
            color: isColored? (isActive? primaryColor : flatButtonTextColor) : textOnPrimary
            font.pixelSize: myButton.isActive? fontSizeActiveNavigationButton : fontSizeInactiveNavigationButton
        } // label
    } // column
    onClicked: {
        navigationIndex = index
    }
} // myButton
