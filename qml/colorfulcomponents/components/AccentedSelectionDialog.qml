import QtQuick 1.1
import com.nokia.meego 1.0

SelectionDialog {
    platformStyle: SelectionDialogStyle {
        itemSelectedBackground: "image://theme/" + __ACTIVE_COLOR + (__ACTIVE_COLOR === "" ? "" : "-") + "meegotouch-list-fullwidth-background-selected"
        itemPressedBackground: "image://theme/" + __ACTIVE_COLOR + (__ACTIVE_COLOR === "" ? "" : "-") + "meegotouch-button-inverted-background-pressed-vertical-center"
    }
}
