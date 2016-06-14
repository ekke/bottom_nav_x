// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.0
import "../common"

Popup {
    id: popup
    property bool suppressInactiveLabelsSettings: suppressInactiveLabels
    property bool hideTitleBarSettings: hideTitleBar
    property bool navigationBarIsColoredSettings: navigationBarIsColored

    // default behavior for this Popup: OK Button Clicked
    property bool isOk: true
    x: parent.width - width - 12
    y: parent.height - height - 12
    width: Math.min(appWindow.width, appWindow.height) / 3 * 2
    height: Math.min(appWindow.height, theContent.height +10)
    // Attention: clip should be used carefully,
    // but using a Flickable inside a Popup
    // you must set it to true
    // otherwise content will appear outside while scrolling
    clip: true

    Flickable {
        contentHeight: popup.height
        anchors.fill: parent


        ColumnLayout {
            id: theContent
            anchors.right: parent.right
            anchors.left: parent.left
            spacing: 6
            LabelSubheading {
                text: qsTr("Settings Navigation Bar")
                color: accentColor
            }
            RowLayout {
                Switch {
                    focusPolicy: Qt.NoFocus
                    topPadding: 6
                    leftPadding: 12
                    text: qsTr("Suppress inactive Labels")
                    checked: suppressInactiveLabels
                    onCheckedChanged: {
                        suppressInactiveLabelsSettings = checked
                    }
                } // switch suppressInactiveLabels
            } // row switch suppressInactiveLabels
            RowLayout {
                Switch {
                    focusPolicy: Qt.NoFocus
                    leftPadding: 12
                    text: qsTr("Hide TitleBar")
                    checked: hideTitleBar
                    onCheckedChanged: {
                        hideTitleBarSettings = checked
                    }
                } // switch hideTitleBar
            } // row switch hideTitleBar
            RowLayout {
                Switch {
                    focusPolicy: Qt.NoFocus
                    leftPadding: 12
                    text: qsTr("NaviagtionBar Primary Color")
                    checked: navigationBarIsColored
                    onCheckedChanged: {
                        navigationBarIsColoredSettings = checked
                    }
                } // switch navigationBarIsColored
            } // row switch navigationBarIsColored


            RowLayout {
                ButtonFlat {
                    id: cancelButton
                    text: qsTr("Cancel")
                    textColor: popupTextColor
                    opacity: opacityBodySecondary
                    onClicked: {
                        isOk = false
                        popup.close()
                    }
                } // cancelButton
                ButtonFlat {
                    id: okButton
                    text: qsTr("OK")
                    textColor: accentColor
                    onClicked: {
                        isOk = true
                        popup.close()
                    }
                } // okButton
            } // row button

        } // col layout

        ScrollIndicator.vertical: ScrollIndicator { }

    } // flickable

    function update() {
        if(isOk) {
            suppressInactiveLabels = suppressInactiveLabelsSettings
            hideTitleBar = hideTitleBarSettings
            navigationBarIsColored = navigationBarIsColoredSettings
        }
    }

} // popup
