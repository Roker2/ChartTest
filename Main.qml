import QtQuick
import QtQuick.Window
import QtCharts

Window {
	width: 640
	height: 480
	visible: true
	title: qsTr("Hello World")

	ChartView {
		anchors.fill: parent
	}
}
