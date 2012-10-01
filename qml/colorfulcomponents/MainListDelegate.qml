import QtQuick 1.1
import com.nokia.meego 1.0
import "CreateObject.js" as ObjectCreator

Item {
    width: parent.width
    height: 64

    function showDetailsPage(name)
    {
        var newPage = ObjectCreator.createObject(Qt.resolvedUrl(name+"Page.qml"), appWindow.pageStack);
        appWindow.pageStack.push(newPage);
    }

    Text {
        id: title
        anchors.left: parent.left
        anchors.leftMargin: __MARGIN
        anchors.verticalCenter: parent.verticalCenter

        text: name
        color: __TEXT_COLOR
        font.bold: true
        font.pixelSize: __STANDARD_FONT_SIZE
        elide: Text.ElideRight
        style: Text.Raised
        styleColor: __ACTIVE_COLOR_TEXT
    }

    Image {
        anchors { right: parent.right; rightMargin: __MARGIN; verticalCenter: parent.verticalCenter; }
        source: theme.inverted ? "gfx/drilldown-arrow-white.png" : "gfx/drilldown-arrow.png"
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        onClicked: {
            showDetailsPage(name);
        }
    }
}
