import QtQuick 1.1
import com.nokia.meego 1.0
import "components"

Page {
    tools: commonTools

    PageHeader {
        anchors.top: parent.top
        anchors.left: parent.left
        title: __APP_NAME + " page"
    }

    Label {
        id: label
        anchors.centerIn: parent
        text: qsTr("Hello world!")
        visible: false
    }

    Button{
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: label.bottom
            topMargin: 10
        }
        text: qsTr("Click here!")
        onClicked: aboutDialog.open()
    }

    AboutDialog {
        id: aboutDialog

        message: "Technology preview for the colorful-components package. <br><br> &copy; Tomasz Pieniążek 2012 <br>"
        icon: "gfx/info.png"
    }
}
