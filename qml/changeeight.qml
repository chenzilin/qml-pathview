import QtQuick 2.0

Rectangle {
	width: 400
	height: 400

	Item {
		width: 300
		height: 300
		anchors.centerIn: parent

		ListModel {
			id: appModel
			ListElement { name: "Music"; icon: "qrc:/images/AudioPlayer_48.png" }
			ListElement { name: "Global"; icon: "qrc:/images/Global_48.png" }
			ListElement { name: "Movies"; icon: "qrc:/images/VideoPlayer_48.png" }
			ListElement { name: "Setting"; icon: "qrc:/images/Setting_48.png" }
			ListElement { name: "Camera"; icon: "qrc:/images/Camera_48.png" }
			ListElement { name: "Cube"; icon: "qrc:/images/Cube_48.png" }
			ListElement { name: "Calendar"; icon: "qrc:/images/DateBook_48.png" }
			ListElement { name: "Butterfly"; icon: "qrc:/images/Butterfly_48.png" }
			ListElement { name: "Messaging"; icon: "qrc:/images/EMail_48.png" }
			ListElement { name: "Real"; icon: "qrc:/images/Real_48.png" }
			ListElement { name: "Todo List"; icon: "qrc:/images/TodoList_48.png" }
		}

		Component {
			id: appDelegate

			Column {
				id: wrapper

				Item {
					width: 100
					height: 100
					scale: wrapper.PathView.isCurrentItem ? 0.8 : 0.4

					Image {
						id: myIcon
						y: 20; anchors.horizontalCenter: parent.horizontalCenter
						source: icon
						smooth: true
					}
					Text {
						anchors { top: myIcon.bottom; horizontalCenter: parent.horizontalCenter }
						text: name
						smooth: true
					}

					MouseArea {
						anchors.fill: parent
						onClicked: view.currentIndex = index
					}
				}
			}
		}

		Component {
			id: appHighlight

			Rectangle {
				width: 60
				height: 60
				color: "lightsteelblue"
			}
		}

		PathView {
			id: view
			anchors.fill: parent
			highlight: appHighlight
			preferredHighlightBegin: 0.5
			preferredHighlightEnd: 0.2
			focus: true
			model: appModel
			delegate: appDelegate
			path: Path {
				startX: 150
				startY: 280
				PathAttribute { name: "iconScale"; value: 0.3 }
				PathArc {
					x: 150
					y: 20
					radiusX: 130
					radiusY: 130
					useLargeArc: true
				}
				PathArc {
					x: 150
					y: 280
					radiusX: 130
					radiusY: 130
					useLargeArc: true
				}
			}

			Keys.onLeftPressed: if (!moving) decrementCurrentIndex()
			Keys.onRightPressed: if (!moving) incrementCurrentIndex()
		}
	}
}
