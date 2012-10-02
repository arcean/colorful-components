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
        title: "Button"
    }

    Flickable {
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: __MARGIN
        contentHeight: height + 1

        ComboboxItem {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right

            title: qsTr("ComboboxItem Header #1")
            initialValue: "1"

            model: ListModel {
                ListElement { name: "ListTitle #1"; value: "1"; }
                ListElement { name: "ListTitle #2"; value: "2"; }
                ListElement { name: "ListTitle #3"; value: "3"; }
            }

            onValueChosen: console.log("Chosen value: " + value)
        }
    }
}
