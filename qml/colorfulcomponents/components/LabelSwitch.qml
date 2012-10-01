import QtQuick 1.1
import com.nokia.meego 1.0

Item {
    property alias text: label.text
    property alias checked: accentedSwitch.checked

    Label {
        id: label
        anchors.left: parent.left
    }

    AccentedSwitch {
        id: accentedSwitch
        anchors.right: parent.right
        anchors.verticalCenter: label.verticalCenter
    }
}
