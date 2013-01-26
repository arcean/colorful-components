import QtQuick 1.0
import com.nokia.meego 1.0

TextField {
    platformStyle: TextFieldStyle {
        backgroundSelected: "image://theme/" + __ACTIVE_COLOR + (__ACTIVE_COLOR === "" ? "" : "-") + "meegotouch-textedit-background-selected"
        backgroundDisabled: "image://theme/" + __ACTIVE_COLOR + (__ACTIVE_COLOR === "" ? "" : "-") + "meegotouch-textedit-background-disabled"
        backgroundError: "image://theme/" + __ACTIVE_COLOR + (__ACTIVE_COLOR === "" ? "" : "-") + "meegotouch-textedit-background-error"
    }
}
