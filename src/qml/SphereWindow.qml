import QtQuick
import QtQuick.Scene3D
import Qt3D.Core
import Qt3D.Extras
import Qt3D.Render
import Qt3D.Input

Scene3D {
	id: scene3D
	focus: true
	aspects: ["input", "logic"]

	Entity {
		components: [
			RenderSettings {
				activeFrameGraph: ForwardRenderer {
					clearColor: "white"
					camera: camera
					showDebugOverlay: true
				}
			},
			InputSettings {}
		]
		Camera {
			id: camera
			projectionType: CameraLens.PerspectiveProjection
			fieldOfView: 45
			aspectRatio: 16 / 9
			nearPlane: 0.1
			farPlane: 1000.0
			position: Qt.vector3d(0.0, 0.0, -40.0)
			upVector: Qt.vector3d(0.0, 1.0, 0.0)
			viewCenter: Qt.vector3d(0.0, 0.0, 0.0)
		}
		OrbitCameraController {
			camera: camera
		}
		SphereMesh {
			id: sphereMesh
			radius: 3
		}
		Transform {
			id: sphereTransform
			property real userAngle: 0.0
			matrix: {
				var m = Qt.matrix4x4()
				m.rotate(userAngle, Qt.vector3d(0, 1, 0))
				m.translate(Qt.vector3d(10, -5, 0))
				return m
			}
		}
		PhongMaterial {
			id: material
			diffuse: "red"
			specular: "orange"
		}
		Entity {
			id: sphereEntity
			components: [sphereMesh, material, sphereTransform]
		}
	}
}
