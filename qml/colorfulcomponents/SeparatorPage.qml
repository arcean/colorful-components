import QtQuick 1.1
import com.nokia.meego 1.0
import "components"

Page {
    tools: ToolBar {
        id: toolbar

        tools: ToolBarLayout {
            ToolIcon {
                platformIconId: "toolbar-back"
                onClicked: appWindow.pageStack.pop()
            }
        }
    }

    PageHeader {
        id: header
        anchors.top: parent.top
        anchors.left: parent.left
        title: "Separator"
    }

    Flickable {
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: __MARGIN
        contentHeight: height + 1

        Label {
            id: labelTop
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
        }

        Separator {
            id: separator
            anchors.topMargin: __MARGIN
            anchors.top: labelTop.bottom
            anchors.left: parent.left
            anchors.right: parent.right
        }

        Label {
            id: labelMid
            anchors.topMargin: __MARGIN
            anchors.top: separator.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            text: "That's a standard separator ^."
        }

        LabelSeparator {
            id: labelSeparator
            anchors.topMargin: __MARGIN
            anchors.top: labelMid.bottom
            anchors.left: parent.left
            anchors.right: parent.right

            text: "Example"
        }

        Label {
            id: labelBot
            anchors.topMargin: __MARGIN
            anchors.top: labelSeparator.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            text: "That's a LabelSeparator ^."
        }

    }
}
