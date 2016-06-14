// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import "../pages"

Loader {
    id: pageLoader
    active: false
    source: modelData.source
    onLoaded: {
        item.init()
        rootPane.replace(item)
        if(index == 0) {
            fab.visible = true
        }
    }
}
