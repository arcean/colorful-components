import QtQuick 1.0
import com.nokia.meego 1.0

Image {
    id: header
    property alias title: titleLabel.text
    property alias subtitle: detailsLabel.text
    property bool clickable: true
    signal clicked()
    z: 1
    height: 72
    source: (mouseArea.pressed && clickable) ? "image://theme/" + __ACTIVE_COLOR + "-meegotouch-view-header-fixed-pressed" :
                                               "image://theme/" + __ACTIVE_COLOR + "-meegotouch-view-header-fixed"

    Label {
        id: titleLabel
        x: __MARGIN
        y: subtitle.length == 0 ? 15 : 10

        color: "white"
        font.pixelSize: subtitle.length == 0 ? __HEADER_FONT_SIZE : __STANDARD_FONT_SIZE
        font.bold: subtitle.length == 0 ? false : true
    }

    Label {
        id: detailsLabel
        anchors {
            top: titleLabel.bottom
            left: parent.left
            leftMargin: __MARGIN
        }

        color: "white"
        font.pixelSize: __SMALL_FONT_SIZE
        font.bold: false
        visible: text.length == 0 ? false : true
    }

    Image {
        anchors { right: parent.right; rightMargin: 20; verticalCenter: parent.verticalCenter }
        source: "internal_gfx/textinput-combobox-arrow.png"
        sourceSize.width: width
        sourceSize.height: height
        visible: header.clickable
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        onClicked: {
            header.clicked();
        }
    }
}
