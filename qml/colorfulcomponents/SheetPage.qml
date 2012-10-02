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
        title: "Sheet"
    }

    Flickable {
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: __MARGIN
        contentHeight: height + 1


        AccentedButton {
            id: standardButton
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            width: 400
            text: "Press me to open standard sheet"

            onClicked: standardSheet.open()
        }

        AccentedButton {
            id: accentedButton
            anchors.top: standardButton.bottom
            anchors.topMargin: __MARGIN
            anchors.horizontalCenter: parent.horizontalCenter
            width: 400
            text: "Press me to open accented sheet"

            onClicked: accentedSheet.open()
        }
    }

    Sheet {
        id: standardSheet

        acceptButtonText: "Save"
        rejectButtonText: "Cancel"

        content: Flickable {
            anchors.fill: parent
            anchors.margins: __MARGIN
            contentWidth: column.width
            contentHeight: column.height
            flickableDirection: Flickable.VerticalFlick

            Column {
                id: column
                anchors.fill: parent
                spacing: 10

                Label {
                    text: "I'm the standard sheet"
                }
            }
        }
    }

    AccentedSheet {
        id: accentedSheet

        acceptButtonText: "Save"
        rejectButtonText: "Cancel"

        content: Flickable {
            anchors.fill: parent
            anchors.margins: __MARGIN
            contentWidth: accentedColumn.width
            contentHeight: accentedColumn.height
            flickableDirection: Flickable.VerticalFlick

            Column {
                id: accentedColumn
                anchors.fill: parent
                spacing: 10

                Label {
                    text: "I'm the accented sheet"
                }
            }
        }
    }
}
