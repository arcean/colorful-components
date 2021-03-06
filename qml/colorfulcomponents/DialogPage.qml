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
        title: "Dialog"
    }

    Flickable {
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: __MARGIN
        contentHeight: height + 1

        StyledButton {
            id: aboutDialogButton
            anchors.topMargin: __MARGIN
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter

            text: "Open about dialog"
            onClicked: aboutDialog.open()
        }

        StyledButton {
            id: commonDialogButton
            anchors.topMargin: __MARGIN
            anchors.top: aboutDialogButton.bottom
            anchors.horizontalCenter: parent.horizontalCenter

            text: "Open common dialog"
            onClicked: commonDialog.open()
        }

    }

    CommonDialog {
        id: commonDialog
        titleText: "CommonDialog"

        content: Item {
            Label {
                color: "white"
                text: "Placeholder"
            }
        }
    }

    AboutDialog {
        id: aboutDialog

        message: "Technology preview for the colorful-components package. <br><br> &copy; Tomasz Pieniążek 2012 <br>"
        icon: "gfx/info.png"
    }
}
