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
        title: "TextField"
    }

    Flickable {
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: __MARGIN
        contentHeight: height + 1

        TextField {
            id: normalTextfield
            anchors.topMargin: __MARGIN
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right

            text: "I'm a standard text field"
        }

        AccentedTextField {
            id: accentedTextfield
            anchors.topMargin: __MARGIN
            anchors.top: normalTextfield.bottom
            anchors.left: parent.left
            anchors.right: parent.right

            text: "I'm an accented text field"
        }
    }
}
