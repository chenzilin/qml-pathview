import QtQuick 2.0

Rectangle {
	width: 400
	height: 400

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
		ListElement { name: "Concha"; icon: "qrc:/images/Concha_48.png" }
		ListElement { name: "Contacts"; icon: "qrc:/images/AddressBook_48.png" }
	}

	Component {
		id: appDelegate

		Item {
			width: 100
			height: 100
			scale: PathView.iconScale

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

	Component {
		id: appHighlight

		Rectangle {
			width: 80
			height: 80;
			color: "lightsteelblue"
		}
	}

	PathView {
		id: view
		anchors.fill: parent
		highlight: appHighlight
		preferredHighlightBegin: 0.5
		preferredHighlightEnd: 0.5
		focus: true
		model: appModel
		delegate: appDelegate
		path: Path {
			startX: 350
			startY: 100
			PathAttribute { name: "iconScale"; value: 0.3 }
			PathQuad { x: 200; y: 20; controlX: 300; controlY: 30 }
			PathAttribute { name: "iconScale"; value: 0.4 }
			PathQuad { x: 80; y: 100; controlX: 110; controlY: 30 }
			PathAttribute { name: "iconScale"; value: 0.5 }
			PathQuad { x: 200; y: 200; controlX: 90; controlY: 170 }
			PathAttribute { name: "iconScale"; value: 1.0 }
			PathQuad { x: 320; y: 300; controlX: 280; controlY: 220 }
			PathAttribute { name: "iconScale"; value: 0.5 }
			PathQuad { x: 200; y: 380; controlX: 270; controlY: 370 }
			PathAttribute { name: "iconScale"; value: 0.4 }
			PathQuad { x: 50; y: 300; controlX: 80; controlY: 370 }
			PathAttribute { name: "iconScale"; value: 0.3 }
		}

		Keys.onLeftPressed: if (!moving) decrementCurrentIndex()
		Keys.onRightPressed: if (!moving) incrementCurrentIndex()
	}
}
