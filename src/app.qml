Item {
	anchors.fill: context;

	WebSocketClient {
		id: client;
		ip: "192.168.0.106";
		port: "42451";
	}

	IpInput {
		y: 20;
		anchors.horizontalCenter: parent.horizontalCenter;
	}

	Text {
		y: 50;
		width: 100%;
		color: "#F44336";
		text: "No connection";
		horizontalAlignment: Text.AlignHCenter;
		font.pixelSize: 32;
	}

	WebItem {
		y: 100;
		width: 130;
		height: 40;
		anchors.horizontalCenter: parent.horizontalCenter;
		color: "#4CAF50";

		Text {
			width: 100%;
			height: 100%;
			verticalAlignment: Text.AlignVCenter;
			horizontalAlignment: Text.AlignHCenter;
			font.pixelSize: 21;
			color: "#fff";
			text: "Connect";
		}

		onClicked: { log("TODO: impl") }
	}
}
