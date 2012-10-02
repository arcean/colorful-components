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
        title: "MessageHandler"
    }

    Flickable {
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: __MARGIN
        contentHeight: height + 1

        Label {
            id: label
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right

            text: "MessageHandler implements InfoBanner component. The InfoBanner component is used to display information to the user. The number of lines of text is limited to 3."
        }

        AccentedButton {
            anchors.topMargin: __MARGIN
            anchors.top: label.bottom
            anchors.horizontalCenter: parent.horizontalCenter

            text: "Show me a message"
            onClicked: messageHandler.showMessage("Here's your message")
        }
    }

    MessageHandler {
        id: messageHandler
    }

}
