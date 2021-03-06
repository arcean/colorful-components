import QtQuick 1.1
import com.nokia.meego 1.0
import "components"

Page {
    tools: commonTools

    PageHeader {
        id: header
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        title: __APP_NAME + " page"
    }

    ListView {
        id: mainList
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        model: exampleModel
        delegate:     MainListDelegate {
            id: exampleDelegate
        }
    }

    ScrollDecorator {
        flickableItem: mainList
    }

    ListModel {
        id: exampleModel
        ListElement {
            name: "Button"
        }
        ListElement {
            name: "ComboboxItem"
        }
        ListElement {
            name: "Dialog"
        }
        ListElement {
            name: "HarmattanDatePicker"
        }
        ListElement {
            name: "HarmattanTimePicker"
        }
        ListElement {
            name: "Header"
        }
        ListElement {
            name: "MessageHandler"
        }
        ListElement {
            name: "SelectionDialog"
        }
        ListElement {
            name: "Separator"
        }
        ListElement {
            name: "Sheet"
        }
        ListElement {
            name: "Switch"
        }
        ListElement {
            name: "TextField"
        }
        ListElement {
            name: "TumblerButton"
        }
    }
}
