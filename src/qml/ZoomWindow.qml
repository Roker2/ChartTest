import QtQuick
import QtCharts

ChartView {
	id: root

	title: "Zoom test"
	theme: ChartView.ChartThemeDark
	antialiasing: true

	SplineSeries {
		name: "Spline"
		XYPoint { x: 0; y: 0.0 }
		XYPoint { x: 1.1; y: 3.2 }
		XYPoint { x: 1.9; y: 2.4 }
		XYPoint { x: 2.1; y: 2.1 }
		XYPoint { x: 2.9; y: 2.6 }
		XYPoint { x: 3.4; y: 2.3 }
		XYPoint { x: 4.1; y: 3.1 }
	}

	MouseArea {
		property var firstClick: undefined

		anchors.fill: parent

		onClicked: (mouse) => {
			const point = Qt.point(mouse.x, mouse.y)
			if (firstClick === undefined) {
				firstClick = point
			} else {
				const minX = Math.min(firstClick.x, point.x)
				const minY = Math.min(firstClick.y, point.y)
				const maxX = Math.max(firstClick.x, point.x)
				const maxY = Math.max(firstClick.y, point.y)
				const width = maxX - minX
				const height = maxY - minY

				root.zoomIn(Qt.rect(minX, minY,
										 width, height))
				firstClick = undefined
			}
		}
	}
}
