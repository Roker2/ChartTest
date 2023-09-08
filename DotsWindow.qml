import QtQuick
import QtCharts
import QtQuick.Controls

ChartView {
	id: root

	title: "Zoom test"
	antialiasing: true

	ScatterSeries {
		name: "Spline"
		XYPoint { x: 0; y: 0.0 }
		XYPoint { x: 1.1; y: 3.2 }
		XYPoint { x: 1.9; y: 2.4 }
		XYPoint { x: 2.1; y: 2.1 }
		XYPoint { x: 2.9; y: 2.6 }
		XYPoint { x: 3.4; y: 2.3 }
		XYPoint { x: 4.1; y: 3.1 }

		onDoubleClicked: {
			remove(point.x, point.y)
		}

		onHovered: {
			if (state) {
				const position = mapToPosition(point)
				toolTip.x = position.x
				toolTip.y = position.y
				toolTip.show("x: " + point.x + ", y:" + point.y)
			} else {
				toolTip.hide()
			}
		}
	}

	ToolTip {
		id: toolTip
	}
}
