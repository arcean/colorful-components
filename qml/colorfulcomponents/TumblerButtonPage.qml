import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.1
import "components"

Page {
    tools: ToolBarLayout {
        ToolIcon {
            platformIconId: "toolbar-back"
            onClicked: appWindow.pageStack.pop()
        }
    }


    PageHeader {
        id: header
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        title: "TumblerButton"
    }

    Flickable {
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: __MARGIN
        contentHeight: height + 1

        TumblerButton {
            id: tumblerButton
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            width: 400

            text: "Tumbler button"
        }

        AccentedTumblerButton {
            id: accentedTumblerButton
            anchors.top: tumblerButton.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            width: 400

            text: "Accented tumbler button"
        }
    }
}
