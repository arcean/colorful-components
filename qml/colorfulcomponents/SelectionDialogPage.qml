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
        title: "SelectionDialog"
    }

    Flickable {
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: __MARGIN
        contentHeight: height + 1

        AccentedButton {
            id: button1
            anchors.topMargin: __MARGIN
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right

            text: "Open SelectionDialog"
            onClicked: singleSelectionDialog.open()
        }

        AccentedButton {
            id: button2
            anchors.topMargin: __MARGIN
            anchors.top: button1.bottom
            anchors.left: parent.left
            anchors.right: parent.right

            text: "Open AccentedSelectionDialog"
            onClicked: singleAccentedSelectionDialog.open()
        }
    }

    SelectionDialog {
        id: singleSelectionDialog
        titleText: "Dialog Header #1"
        selectedIndex: 1

        model: ListModel {
            ListElement { name: "ListTitle #1" }
            ListElement { name: "ListTitle #2" }
            ListElement { name: "ListTitle #3" }
        }
    }

    AccentedSelectionDialog {
        id: singleAccentedSelectionDialog
        titleText: "Dialog Header #2"
        selectedIndex: 1

        model: ListModel {
            ListElement { name: "ListTitle #4" }
            ListElement { name: "ListTitle #5" }
            ListElement { name: "ListTitle #6" }
        }
    }
}
