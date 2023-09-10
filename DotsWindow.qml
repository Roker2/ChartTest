import QtQuick
import QtCharts
import QtQuick.Controls

ChartView {
	id: root

	title: "Dots"
	theme: ChartView.ChartThemeDark
	antialiasing: true

	ScatterSeries {
		name: "Random dots"
		XYPoint { x: 0; y: 0.0 }
		XYPoint { x: 1.1; y: 3.2 }
		XYPoint { x: 1.9; y: 2.4 }
		XYPoint { x: 2.1; y: 2.1 }
		XYPoint { x: 2.9; y: 2.6 }
		XYPoint { x: 3.4; y: 2.3 }
		XYPoint { x: 4.1; y: 3.1 }

		onClicked: (point) => {
			remove(point.x, point.y)
		}

		onHovered: (point, state) => {
			if (state) {
				const position = mapToPosition(point)
				toolTip.x = position.x
				toolTip.y = position.y
				toolTip.show("x: %1, y: %2"
							 .arg(point.x)
							 .arg(point.y))
			} else {
				toolTip.hide()
			}
		}
	}

	ToolTip {
		id: toolTip
	}
}
