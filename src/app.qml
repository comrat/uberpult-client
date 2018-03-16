Item {
	anchors.fill: context;

	WebSocketClient {
		id: client;
		port: "42451";
	}

	IpInput {
		id: ipInput;
		y: 20;
		anchors.horizontalCenter: parent.horizontalCenter;
	}

	Text {
		y: 50;
		width: 100%;
		color: client.connected ? "#4CAF50" : "#F44336";
		text: client.connected ? "Connected" : "No connection";
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

		onClicked: {
			client.ip = ipInput.value
			client.connect()
		}
	}
}
