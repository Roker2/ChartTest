import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

import CustomStyle

Window {
	width: 640
	height: 480
	visible: true
	title: qsTr("Chart Test")
	color: "black"

	TabBar {
		id: tabBar

		anchors.top: parent.top
		anchors.left: parent.left
		anchors.right: parent.right

		CustomTabButton {
			text: qsTr("Sinus")
		}

		CustomTabButton {
			text: qsTr("Bar chart")
		}

		CustomTabButton {
			text: qsTr("Zoom test")
		}

		CustomTabButton {
			text: qsTr("Dots")
		}

		CustomTabButton {
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

		BarChartWindow {
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
