import QtQuick 1.1
import com.nokia.extras 1.0

InfoBanner {
    id: infoBanner
    anchors.top: parent.top
    anchors.topMargin: __MARGIN
    z: 99

    function showMessage(message) {
        infoBanner.text = message;
        infoBanner.show();
    }
}
