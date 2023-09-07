import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

Window {
	width: 640
	height: 480
	visible: true
	title: qsTr("Hello World")
	color: Qt.black

	TabBar {
		id: tabBar

		anchors.top: parent.top
		anchors.left: parent.left
		anchors.right: parent.right

		TabButton {
			text: qsTr("Sinus")
		}
	}

	StackLayout {
		anchors.top: tabBar.bottom
		anchors.left: parent.left
		anchors.right: parent.right
		anchors.bottom: parent.bottom

		currentIndex: tabBar.currentIndex

		SinusWindow {
			Layout.fillHeight: true
			Layout.fillWidth: true
		}
	}
}
