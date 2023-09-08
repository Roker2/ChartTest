import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

Window {
	width: 640
	height: 480
	visible: true
	title: qsTr("Hello World")
	color: "black"

	TabBar {
		id: tabBar

		anchors.top: parent.top
		anchors.left: parent.left
		anchors.right: parent.right

		TabButton {
			text: qsTr("Sinus")
		}

		TabButton {
			text: qsTr("Bar chart")
		}

		TabButton {
			text: qsTr("Zoom test")
		}

		TabButton {
			text: qsTr("Dots")
		}

		TabButton {
			text: qsTr("Sphere")
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

		BarChart {
			Layout.fillHeight: true
			Layout.fillWidth: true
		}

		ZoomWindow {
			Layout.fillHeight: true
			Layout.fillWidth: true
		}

		DotsWindow {
			Layout.fillHeight: true
			Layout.fillWidth: true
		}

		SphereWindow {
			Layout.fillHeight: true
			Layout.fillWidth: true
		}
	}
}
