Rectangle {
	anchors.fill: context;
	color: "#fff";

	Device { id: device; }

	WebSocketClient {
		id: client;
		property string ip;
		property string port: "42451";
		url: "ws://" + ip + ":" + port;

		pressKey(key): {
			var keyCode = _globals.core.getKeyCodeByName(key)
			if (keyCode) {
				var event = { keyCode : keyCode , timeStamp: new Date().getTime() }
				this.parent._context.processKey(event)
			}
		}

		onMessage(data): {
			if (!data || !data.event)
				return

			var event = data.event
			switch (event) {
				case "accelerometer":
					phone.alpha = data.alpha
					phone.beta = data.beta
					phone.gamma = data.gamma
					break
				case "keyPressed":
					log("real keypressed", data.key)
					this.pressKey(data.key)
					break
				case "leftJoystick":
					var axes = data.axes
					log("Left joystick", axes)
					break
				case "rightJoystick":
					var axes = data.axes
					log("Right joystick", axes)
					break
			}
		}
	}

	IpInput {
		id: ipInput;
		y: 20;
		anchors.horizontalCenter: parent.horizontalCenter;
	}

	NumberInput {
		id: port;
		y: 50;
		width: 60;
		height: 20;
		horizontalAlignment: Text.AlignHCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		value: client.port;
		min: 0;

		Border { width: 1; color: "#000"; }
	}

	Text {
		y: 80;
		width: 100%;
		color: client.state == WebSocket.Open ? "#4CAF50" : "#F44336";
		text: client.state == WebSocket.Open ? "Connected" : "No connection";
		horizontalAlignment: Text.AlignHCenter;
		font.pixelSize: 32;
	}

	WebItem {
		y: 130;
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

	ServerPhoneControl {
		id: phone;
		y: 230;
	}

	Text {
		id: lastKeyText;
		y: 550;
		width: 100%;
		horizontalAlignment: Text.AlignHCenter;
		font.pixelSize: 21;
		color: "#000";
	}

	onKeyPressed: { lastKeyText.text = "Key:" + key }

	onCompleted: {
		if (device.lockOrientation)
			device.lockOrientation("portrait-primary")
	}
}
