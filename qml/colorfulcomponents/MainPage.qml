import QtQuick 1.1
import com.nokia.meego 1.0
import "components"

Page {
    tools: commonTools

    PageHeader {
        id: header
        anchors.top: parent.top
        anchors.left: parent.left
        title: __APP_NAME + " page"
    }

    ListView {
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        model: exampleModel
        delegate:     MainListDelegate {
            id: exampleDelegate
        }
    }

    ListModel {
        id: exampleModel
        ListElement {
            name: "Button"
        }
        ListElement {
            name: "Dialog"
        }
        ListElement {
            name: "Switch"
        }
        ListElement {
            name: "TextField"
        }
    }

    AboutDialog {
        id: aboutDialog

        message: "Technology preview for the colorful-components package. <br><br> &copy; Tomasz Pieniążek 2012 <br>"
        icon: "gfx/info.png"
    }
}
