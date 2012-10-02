import QtQuick 1.1
import com.nokia.meego 1.0
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
        title: "Button"
    }

    Flickable {
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: __MARGIN
        contentHeight: height + 1

        Button {
            id: normalButton
            anchors.topMargin: __MARGIN
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter

            text: "I'm a standard button"
        }

        AccentedButton {
            id: accentedButton
            anchors.topMargin: __MARGIN
            anchors.top: normalButton.bottom
            anchors.horizontalCenter: parent.horizontalCenter

            text: "I'm an accented button"
        }

        StyledButton {
            id: styledButton
            anchors.topMargin: __MARGIN
            anchors.top: accentedButton.bottom
            anchors.horizontalCenter: parent.horizontalCenter

            text: "I'm a styled button"
        }
    }
}
