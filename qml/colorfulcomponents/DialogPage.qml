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

            anchors.topMargin: __MARGIN
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter

            text: "Open about dialog"
            onClicked: aboutDialog.open()
        }

    }

    AboutDialog {
        id: aboutDialog

        message: "Technology preview for the colorful-components package. <br><br> &copy; Tomasz Pieniążek 2012 <br>"
        icon: "gfx/info.png"
    }
}
