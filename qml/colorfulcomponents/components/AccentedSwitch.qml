import QtQuick 1.1
import com.nokia.meego 1.0

Switch {
    platformStyle: SwitchStyle {
        switchOn: "image://theme/" + __ACTIVE_COLOR + (__ACTIVE_COLOR === "" ? "" : "-") + "meegotouch-switch-on"+__invertedString
    }
}
