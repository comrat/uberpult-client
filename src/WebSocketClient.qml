Object {
	signal error;
	signal closed;
	signal message;
	property string ip;
	property string port;
	property string host: "ws://" + ip + ":" + port;

	init: {
		if (!this.ip || !this.port)
			return

		log("Create socket for host:", this.host)
		var socket = new WebSocket(this.host);
		socket.onopen = function() { log("Sonnection opened") }

		socket.onclose = function(event) { log('Connection was closed. Code:', event.code, 'reason:', event.reason, "wasClean:", event.wasClean) }
		socket.onmessage = function(event) { log("Got message:", event.data) }
		socket.onerror = function(error) { log("Connection error:", error.message) }
	}

	onIpChanged,
	onPortChanged: { this.init() }

	onCompleted: { this.init() }
}
