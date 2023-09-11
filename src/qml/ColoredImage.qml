import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Item {
	id: root

	property alias source: image.source
	property alias color: overlay.color

	Image {
		id: image

		anchors.fill: parent
		antialiasing: true
		sourceSize.height: image.height
		sourceSize.width: image.width
		visible: false
	}

	ColorOverlay {
		id: overlay

		anchors.fill: parent
		source: image
	}
}
